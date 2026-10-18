Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79E73DAAB9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326691; cv=none; b=uHwShr6rRzF2PlxkPEdLGB8sB8m/ZgttgAiG9KqpA6fCSih2mV0stWZ+t7o6uxzMzonPjLkb2Lb1oltiLtHjwnjRWWk/B6qoe7DJYtdN9xZzTt0q6wlIyV1do8hGGD+/s1lC/sHk9UMK+ib3Ct3iBrI3NwrEyi2Z/Ww0wwAZIhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326691; c=relaxed/simple;
	bh=YMQaZYoWCEjZOJsUNyybSKHgjzBxXSFJYQFROm/a2XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tLrjVr83uoShZdEMP+rcyu4XHGgafud8uLQnCoD2FSCHFZbqOaYI6n1WUYPf3BgqinYfy3cH4UW5RqpRpoNLfeIc4d/XOBAb76TK6G9suS6pGAZPTIQgKPJLJv5xBjiVwHNMYxs2HY+87ybwB+l0H5r1f4j3ypuOlcXSZNoIgjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b=Os+nTVhN; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b="Os+nTVhN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1792326681; x=1792931481; i=jan.claussen10@web.de;
	bh=CCCBgC3t202EBUvzUuRYpuK9FpeOT8mgidQb08HiPmk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Os+nTVhNV5aQjFb3I4Vs+VhR++mAN0QfrW0mzXLp7njEsr7o+/EOkIoUygZ63r/f
	 W2RcoTyrjlTWkSe5kSHbbW2xUqDYXvF02PFkWIghbK94bx/Cg53aP8y75GWuVHD26
	 PoAeOk0+uoJQQcmX4G7DnFmW+2vvNCuzy1cRZyKYYJ9mEzCQk1sFMOF8Ug4WadOBe
	 ysFHQlwVzSsTdFPA7ZUaYf1AIZY1hqh0JRr2rnQnFD9hY0kIVmAFsGTkomV9nLoTd
	 TK96zKneBSrzZtXHMDl5uukoUfTaZHUL4QyMABMD1IC7i/dE4FjXOCvjwRKt8bi8i
	 /xaUf/FNvTkUq5mcBw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MXoYQ-1x6KBA2Kse-00YCln; Sun, 18
 Oct 2026 14:31:20 +0200
From: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Daniel Stone <daniels@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	=?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
Cc: John Harrison <John.Harrison@Igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] drm/display: hdmi-state-helper: Force modeset on colorspace change
Date: Sun, 18 Oct 2026 14:30:12 +0200
Message-ID: <20261018123037.19560-3-jan.claussen10@web.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018123037.19560-1-jan.claussen10@web.de>
References: <20261018123037.19560-1-jan.claussen10@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OJkWQDAMi0YPgsmtgoYbQDFzo/V4hDdi3DUG1I78DCx39HWSl8I
 ut0a40aX6NYyD2TI4Za4d2AR9sBVsxpe+sfTj1x80yAK8hOo79I8GMpDmdHqCyRHpXXbZoa
 ZCfDp31Kn/2nbayYTo+jpf5O9ODaZI/pm2z6IRnWZa8GLS3UEH474Jvdyv8v9jChjmd1O0I
 msYIHnUxl0Xq3vwaoDkHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KCk00MSIwWY=;rRBozwfj+iF3lsaGW0pwFn1hnws
 smIIMEH3Ky4ljdL69thuCS/C9PgZia4O1rphR5zgOPCN2w8JiFRL69hyD6kkbK+MhUkmbLJ8W
 NZbYHdMC0gZbfaDroL8cLf7VLl6Vut5E06ij3Q0YPqCyGn305LxE9ljW34VM/9I3nDSsuyoFn
 cABXTcdyBJEyvmsjOY90rWNgwss10zYU9njEyrntqFVuh/UyTf60m51dKzSvNmBxql3hNBaDV
 TM6aYcy2h5+sl4FzEZg+Kn4otmVeQIweetS2MlM2KawAExPgynUSLOYM6D1RiJh650yMhiRiX
 ztO47FROPo0bv3LGfnbSkmhtz8eDeTedTLlUC1zlmA38g0q4xuUwAzxtrawg30wpeHIZGoMQn
 ie9jPTfisDopBwsW533V1KDrEYOm+sS/eyz75UNvyMh7qpwIsQLFci5AIzzo/kPhvD/Kj0OwG
 /YDFIhAFHepwNiw6Y0JBP0VggJjlKWvLvQ7Fw4fHSXyxm29UcZVtuEWSLYtR07auibZE/ixrO
 /GBxtEq/sQJgPjaujcj4aP5QniK0c8DbOKWgjHJQ63yhHKpdiTNH8if2zI3nv01h3ui0g1VKq
 MsnRP91qQYq7HVIlN33mqQW1mvio/eiFktS1yC6DB8TJL7ApT5kedmjx9EjMIK5QJRTVzMlQZ
 pTdeQvPTq+UKG+M+1D5j9/fcX9VD5D8Cjwp12cQQFDEk8j+ZBrxqvh4dvZxI4eZJeE7dXBUOY
 vYw/+GRPdMIA1wGMEdCovIfaGlorw522zcCr4jgk4NQt3JffB3SkeD9XU5mTd4xVXKKDAJEJz
 NV0uvNay8O3TRhxjVxmLFTgDscrftCKKbqVeJSvVT4NAG4rhnOHfEKcFQwBW7WS97MYR0cQC3
 lQjRCT0BfEwHw83mNXdQwpWCtmO9lavcySQzZjbSUJLAbCiRpA2UCNC0wMgtDkd+Ep9d4MJS9
 C8qTZuuchBzEl/WzRm8Dlk8KINaVFAD45mrBAMvYT/BE7+7aSLIwAzg4pO60HQZu7MjcOZOI6
 mkZgaS2QdmTckbfkt7C72bSgOQqyFUTxZWO7Oy2J9iQoos0/NCN4nQJ3JHwHaTp56gJ5uZpDt
 vXJbMekLJZxNhi/Rov26yF0lrOBAROWBzy+LBbSMMwQy2fBV4kw/iXjAIHpDzkpZeCfvtuqcY
 uhJRw2KC66Ne73k0eSMox4juIxar+g/1ntie+kxj2+2EEu+GEbCIJa3kmUcGZ5ltHy/2w4mhG
 gjuyih/P9t6e1PG4VU74QTaZb9HIgvOEWdTCSvKzHahaWkXRO4u8CJ9InOPUfMBt0g9mfo0BS
 TZKu7Y2VKvWxFMMYpDrZosbsjqrtXpdLnYFW782+LJrAxQ94bqwlGeu12dWsWO0irOcVkvLo3
 14h8A2TIwUXL3oBUsWvpGrNW32PZW3jttvKpZ0nCEOT3rDr3Ex0Oja9JSWoLRJVrHHtaQP6/y
 No7OG6gXqt8k+802UDaxxJtD5dz+mDDrndfJLqgcl7EG84fDkKB7r8sM6dWmtxX0L1HC6WXq6
 0kTN2/bXDNxapsg0z0U/2FGWThunLnBdvmKOWQyfUwcNVmIGsZ6jG8Z5xlPjN6s90nYLt1d6V
 VrB8cjv9oO2wI6BJRWUqCMkwAqlzz16+EvOa+r8iGchrX9SV5XAVvCdMeDMseoZvbhVhZ0iQZ
 UHqdZlBPbr/QUzujxa0bXRFqB69GXYlCsJe4PSMxVUHeeHJLeb9uTuHlE+sB7Hb55pUm8HlNK
 t/Dzx2tZAyjhl20wByYlHJcWkomiv8K2Azf9VEG3V4ZjOSmHrB/yhZG+rUz7CVwzkacT0CzcI
 RhTLzdPddiKeiAZdtWMM9Foo/9djWoKSJP1bkWMLkGnwJBV/kuFCIserehLiooeTnYpqs81Qa
 6k4h8vnRSA8Yqf1Zzpa9fCY5tv6x74lpbQbw6PLrX1HsCKR9MNWkDVDuq3lZBDBeszEZlIH1l
 FzaBVC8E2iUTE5MD1t0UMiTYmWRdVAL4pNAx/We1TpK0X+ykWKpK8OMPKB0fGWcH/5OzlP8Ig
 P9q3GDE25XBN/+CjLyYs7/hRHHa2B9IGbo/yWgaIM5oS4GY5oom0Ko7DOt7aCYI7X6F3zoGlV
 m+kML7mRou6OFtF5/diQ6KZltDrndihcpKjAmpAPaoZDgI/vZAutQwWOliwZliFRC9Cft+j4N
 xTPKC8TN7I6IvE/8Gg+yMdJtprDtoarN+DNxtgMgo9xcdI9Cu1O/c69cGVXVq+1Yx8wwGbL8i
 S9Mt2OG8zTko1dHWXns6f1mKRNidr2Yhk57FR6j/T9Hdd7l6lDt7RuOSuzNra61+OOzEIqE20
 Bb8NQ7mA+Mn9LmmRvJWpJqwfmf95IqKOYyet/z/9NbXcTcE12OFQeKlOPzdhnwQgVlK3FSkiQ
 tRJf5f/EXKUUN1mEIT+tD63P8BjJ8OClpjmQcwHtaNcgGTyycjkaIUhjJY+DoG+OtR6JuXuzQ
 0wZHRq/HkR3B2EKoujpemFQ/JSB+mlrF7FpXSpy3jES4/1MWqgG3uoZHQsBoZC8IHEpoCoq+C
 TPEXGITwpnz32PLzDP/0vJZr2tMtlIQxZBE/MbqkgBk5W80txA3zB1kz7yDAIAi5RKPnt21cn
 trLlHAzZ1a9fZTDLg5Xfy05nA4WqJ+oJrgstdvieeWiqZ2aX7X5iSN/yPMSfU6qx6zvLZUjND
 RTzNfJzeL0mFrfegvdZquP6iBVF2ZqPU65h/WBI0x3mbz/nKsyV4bbYoRFvXnn0Bt6HLmfOzT
 HG3AA1NKNgCl+yNAavDf+vkOe9tKojdSu7l8fwwCs72/xo6hKakwH2S3lM5g9up6wzD4bYppf
 Pj8in6OhEscEvZlEI7e5vMNZ5AmSvTKDXnVOoMHP6RZOKDfwmtqSZKFz3Bt9ROnLq7yHNDfGD
 kspAKFzCAgpkT8WJ62mNGYz+c4yR7Gz2aG+s3WMzM5ysFQDWO7H48IDH3ZhcwQ12+d0czfskr
 HStrzl/beVme8j2S2FiAgK5UpKVkqbWZ8Yjsr2d7m/Ccd583VAlwfplYREcYoip5ShUXc1Nq2
 ustKluuQratyCA3w+p5PFPGgxkrduS/9jq6/JitL9qNCLUOuJL7cjrRScbv0oK82foDyeK58o
 iJTQyiaaiPlFZL2iPp23jyJq4VVKlU7PZ/pnc902lJVffXuv7g5sfIVTA5jPQdTrCyFg3UjmA
 Czv/54Os7O/CDRpRyeTL24y910jJQS9vyTPlD7upUXn/n2eEdu16YtjvCRZs+rPfuipru/OPX
 Hz1auXpLfMyLX0CnNE+j6jbB23X2qpcENMZiYPWBPUWyD+Esu/d2FEWbdBRu+cWT8IT5A6VT2
 qe82hpCp2nNlvxO9YZCnqiJqlm9i5GGA9Midf6aykTe0KLZNJAkt4xaZxuja+/SFFqtU5UG92
 tUlONn1USVvvLS7B8E9tU0cZP4Htj1Q/RZfHCP2uIFFjEtoWMl/ML4ai2pdh8TJE1pU2IhjMV
 6+oH4oE8Cn5Zl3V51pOG/mw5r0kktzo3sf13iLjmI20luC7SVZWD/RELu9R+0j7gVfmedQSlu
 daYO/DRFbTB1lAXhHgRDWD5HwCvU15ik8UjY30ERoFCD069C8RM4JxKeZvHUHjHFi7T4fMp2c
 Az0dL6OTauIm88dhBcuzJ86/HRecAXgLOJsVUnvEHCDUxbnl45ZoetVr6Tgnh+UV1orjmjUEO
 aQ8wgmKS6oDXVOiv8jmEmOrXF8SlXV8idV0H5rbXEv5hL/mcHXZaz3Fk42ur5X22S/fFT7XqQ
 lQUD+AJr/m0pnlLIKMhogJxM8Q29JYssyJFo3cBcfalQ1JrRNBOXQcZFahVnX7PfkUFOnqDNp
 jO1v/ZC2elD9fCUtepUJLr9zkl2GDUXUt/cXNW5qi25aIntCHawSAWE1tC5MK3GSlDlkwLbIQ
 Qhu4bvuO/DaYiRVUTosnQ1Qid+W2Cy44/33cC3k0bKJj0dryBBU9yhse/kO8DN4fgASdbA1Nx
 bcW9JCC3gyxklwOI9CwtbQpmBZBbjlsUhvetgEHdM5rLcZwL8MWHfaTCEIEG/Y2qb59/JeiTm
 lfNRItxrnMNxdJU7vxCgVtM+2JyDvVnphPlaIwYCLQTiMcTxSFl1dI+koY4NhrfVmvuSSiJ2Q
 v6BjpM4EWHM3m/xI8Xgin7mLKYpOJ2GNOnivy67kDYIY9w+9P0gdZxnz9LTu2ViqNvgZBmvY0
 AfmfkF5vpgX6vOSWqo0q5gILZzrsn64q9ik5Xb5yjwRzKWiaBMt27N4whqRnaFzw7H5mCGjon
 2Y+gos8B22Redsk9t15/cbjD6Isjp3rWN9BKp1volxatwVANTcJWVMOTgmRGKhWPORtq3IV27
 /336gJzPWmaB7In9R9mRU9/IcQQIvr+Vyuf/uVSCkUe9lh4TPzr7ATgrsJzPVu9ZjnSo7JqTW
 dsdpe9uOSbycOjV80HkiPtigu3tGpJKUaI/enS4Fq5ky3In/t8Rqlzj3/X1oBpnGxxJ4UF+5K
 uAF0/l3gBylsveE9x+m/Vglr5XBxOEJeKI4KcFclzBLz5nIICq2ecNvShK/vDRzt/SRThLfkK
 kwiGKo9LoocmRnrETBLWfASa48TdZbCpdelzwM8xEEtDOGJR+wCHuzRVvuXJqonnOQ54Jt5tT
 /+dAa0/EQ1ei3CWDwX9uGZ0m8WWIWORggDdc8mLXBMVcyzTZDasSKigsTdG3ScCJij2n6jI9b
 3khPaOgngz9eO/6V+0CENpnCzwxx/IM2lgtt5O7f0g/xjfyO+uXFINE/5II1rFDBY8FQYNAdh
 SaHQQzQdbG6SSWm/BtSmspofWNN3dAVY8L0YlT/S/aYU/TEaHMFkPBAGCke9W3FJJmF/Jxzit
 e2yvIXA2cbKmZ9E3Z9oIUiJnsla73eJEvi/KVj4YKPMWzmBoePhvZSG/hXqvZAhcxxbzKJsYy
 na9GABriK5/AZQi4pkLnsHq1LuH+K7RWoxz+9jCtYaSyK26x4+yVFPWSR+yBmk2uvW8bM4U87
 YIBUYetmJHwZ6/S0lQi8HClMb98IRTQsA/lJd/PLOCzvj4y8Z1WuYz//QL7oC9zz8Rc8icxFy
 77mziGJR4RginVNNZRinQQgfe97sOslM8P80uleqgfOmF/hR3TbD4zSdIg0sLi12vCQbLcBgD
 kuuKvGEm1zbWlIuoemZkGTkVJJ7WQzR8hVKGXRIjtRF3mJiPRoank1HmHmyd+YmwbdX6th0s8
 HBE+cPqAoLNpJ05L7cm6GHLHFE6dl0kWIA+z29m+Uj8D+JXDHzh+4KahpiaopcDigt1YiagC7
 Y4ElMgh3zHyn5NT9kpEznkfBcKdrzea4H18bWm2T//Ox0Lksnl1sD8x4O1XY7qH3aGUTko7vc
 dta9vUvBOkrI//f/XlsOlhIBg7dkp8bWExcdyGs3WoDIMM8/I2MutF3zoRvlW2rKWTmyOAOaU
 VDY/sEhlVSIaLzllIEPd1SdxJJhdn7BuFffrAqrXd7UjewI9HMsUA1hJ4MSSZ8pYx+KR8ScjD
 +yNJvf1g7R6NjSo6eZZk2mc84a7jiaQXGKpWVMRA+Z1WRDclZ5qfI4HHUwe4Hm0lezKQPwZhO
 CqCTIvUWxNN4V9mZpgMOW8PsqeimK1470f396iuLqh+R/Kx+F4GPkiCz2hDZumVHTsbgl9XnX
 YU52Hn+qrip2UQ3OntPx1l2z2F3y3N8u8ChfqtxQHjw2+XjNAoG44Md8YfjAPu9cxov0uOgJ5
 vcFGYSQX5CsCgZBZ2SCP5+l7iaqT3JsmY5Ks6ciZIpk/Cn7wbfX50aIY0PIUmrbUL8blWUocP
 Y8Z9wkp3vYSoOSExWuwnie0tqyhT6LQdZGR8MWvAOEkuiSQNXE1oNSWigbVAKEJjezOjh/b9J
 VWQcIRQng5dv+IsV1MGG6nBdHkkF3W+f9SOaxi/xw6CIr/BFRlQ/btX6SK8v4RH4mXTxkWNF2
 yb7vzYdOcLqAM7+yhvtxjz6RcTJ2o5qKHqrRCm4rya6VOfyAMkjTzgM1JImpBAz/E0TkPdeOb
 /EckX541heuVaqi9kZV/x+W74EbPGvBjNlE+BQTiJT+ee1zX1cZSVGbpIrtYuXDkusadOAdBb
 SEqfvYUNXVlkgYnmovTFYH/4D2jlrachVt9iIsfr1BqodTkbgFA4/6VvQ680sJzGZowGSG9EY
 kqMC51GNcVegvoIwMqhLPOAIe1xoBOtnGEmZd9Gh5LWmG8RuxmSB7zrn6PKy1cQjrTdazRQwJ
 dnsSlYlJd4S4unZ5maaJgs2OFNYLUtEiLlDoaipslm8hM2VPEcMLsdBHiHv3Dply4WdccqcbN
 tXfhGiTII92C7PmD0hIi1H13iSGTEF/l9eBwxsQ1DIHDHkpVywZ7FKE0LcbympXqj9rCIiK0H
 4VUfh5nBvx+jr2Ugch6syaL9rOeqQme24V9xWhDxPwUYz7LM1KOCegIuGXSD2jSXDlLP55WZP
 vtoH9/9xQ8FazmmI7Fn1ElZCaTS+YKhd/WEy6vno8Wm031ojZ6v7ERTvxv11cA9BDl1IMNYI1
 2O4o5vWOi5u1DW3r7oLKHy1I2/Urn/Y1orNLzC5Z5lKliOu1GfjbLtutsavZQidv/mPZfPQ+r
 tAD3FiP3ik9+3vIWfMTytHD0fYpnjpbgp6ztaJ/BKZTqOyE66Q0pLHI6n6mhGO3dXZdrOSlA=
 =

The colorimetry signalled to the sink is part of the AVI infoframe,
which is only updated on a modeset. A change of the colorspace
property therefore never reaches the sink.

Treat a colorspace change like a change of the Broadcast RGB, output
bpc or output format, and force a modeset.

Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
=2D--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu=
/drm/display/drm_hdmi_state_helper.c
index 7cdb7ca3dc12..9368e53c5945 100644
=2D-- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -925,7 +925,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_=
connector *connector,
=20
 	if (old_conn_state->hdmi.broadcast_rgb !=3D new_conn_state->hdmi.broadca=
st_rgb ||
 	    old_conn_state->hdmi.output_bpc !=3D new_conn_state->hdmi.output_bpc=
 ||
-	    old_conn_state->hdmi.output_format !=3D new_conn_state->hdmi.output_=
format) {
+	    old_conn_state->hdmi.output_format !=3D new_conn_state->hdmi.output_=
format ||
+	    old_conn_state->colorspace !=3D new_conn_state->colorspace) {
 		struct drm_crtc *crtc =3D new_conn_state->crtc;
 		struct drm_crtc_state *crtc_state;
=20
=2D-=20
2.56.0

