Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779029;
	b=3b/wFQbkSLJQ0/3/hh+EPVxN/ZGMS84TEMq+Gql6QZWbw8zhVrVM1mxB5BH2ZEe5seaz
	 ZI7O1z5O3d0WhLTDOxGcisuVSvLMhwSN7FxYBY9ncQN/KuOf9q6zorjwpp2XdrJWFBpLV
	 FcCLQz/mX4MVzF5SNvzOyrqWrSg6irvi4FUDJs1K/f+0eBVdq4UkdcHry7EootinvMvvR
	 AC0+PW4h7uln7BriMUGEdgtLDjS5lTajsdJi+RKxwC8CV0tDN0saPA+WoCqWU6mvSVgE4
	 eVNW4NcOfayuTCSZFEagIFGeUbJ9RW6wxoG4lJBpLnfbkO/RKK1pIkg3yQRR7CfSHpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779029;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=0m3Eks7vaqmvVw2N8vBB0FOX2yrCaj3oxoQOVkAJNA8=;
	b=LH45lGdMcoad6XCNq7NNZYWZWH7/3y0lyqnM0CsImgerakX1EjHrnFBcmtyDXAsv0gio
	 kHOcJE4lEtbYfs04TJhB21MS4bHqRxhc+E3HNQb5txD9+d2Xk+OGZ2vOYA93Mcm0jkwjn
	 EbaQUGQOI1Jo5/qizQ8RcoRDC4pgli6pHZGbLCIIETv0xSZuEuxyBoGlnKNOv4YaaWg/h
	 Br4jdAqcjVbROV2aXOHar+qTX0eQkakkPfUc1UTy0PgMHmK6qV5GsH2wLW3fyXwKMfI52
	 n8dFoSBddAgF77h2eXdW4cGe7yiNatAPqDyhHa4v9OpAAzrSfd4tJ7wNCDF0AJRFeuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=SQh8r7Zh;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F731606A895
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F731606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=SQh8r7Zh
DKIM2-Signature:  i=1; m=1; t=1794779026;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:UVDVK0qM+pYTXkIkT0/uK2+C7BDD
   0C2MddZrlxjEnoaTkh7A8CX7ETFii0NKILtM72BtKH7DmLUT6r4Gn0dfLx6c7qg+CBmhoqJZU/T
   K02rCcQkNbNUJyAgwDzFFrBmWYOoiTBejekLU9+ky7VYi770rJTn9/C9KKREJB1OW2Us+xCvQxb
   Pn6QXJ1svSz2z5axTIQyvuCgRVn/TPRZ2/JiFMDn9atE510dR62YBBIegn52ZHPh18OB8hrHlQg
   0CUBzuohXi4uImmtiwaWLkgrd/J3Bpow2pSfCf1iq4uAhFVsXz/J7+MWNYkI5d+ynDuO7vMb8J1
   oGDFw7d64TNz4Q==;
Message-Instance:  m=1;
 h=sha256:
   l/OXR5zmi+CVQUHb3EkPmtKuvMujFbzJrqCnofG9Rt0=:
   pWyw+kBvaevKi4YAwIiJZuB6/UixH9VcOwfqFH4byps=,
  sha512:
   tnwjawTnP52IaSZ1I28zAM1cy9rJagSxWZccmravjC74itLDmj9Y4y0lc8LOugx64lMxcrx3F4/0sTigI5anqQ==:
   EaEreiNV0SbonutDzrcQgf+4smPgScUPxPPSMLEzOnjJrA+PPAy9VmBVwDDHR1YzjQT+tZOB5Qt/yUczKHx9Sw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779026; x=1795383826; i=arc@gmx.li;
	bh=0m3Eks7vaqmvVw2N8vBB0FOX2yrCaj3oxoQOVkAJNA8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SQh8r7ZhVVZ9OMmfAlcQVmhBc5gEREc1AWjQPP2iW62z+b17H+ZhD2mbN7jzVWb8
	 7eXVL1NiEsfU0ZMM/I1BuOWC7a4igGrDOsXVqxO5el0AiFHhkLhnYUmCLpHfyDEEl
	 1lC1aQIivuVWjh6C3zvGW6eFPdzMjfG5uhVVT4GjtS9+pbOQFiZvb2UCV7pd3A8eg
	 lXoSpculz0lupJEWpq7QQR8hBKkvkRUKct0ZEbYVk4zi+M6imt92QwNlljjUuNAgd
	 nftN8w++SjHb64hi5OVC+CaeRpYQH7NOLsBk/eMevP+5u8nEtHrg+ZOp709OZDY/5
	 CyUXMJ1neimWuvQoyQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sit-1wNWoA40sB-016rOj; Sun, 15
 Nov 2026 22:43:46 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 07/19] ALSA: mixer_audient: Add integer range checks
Date: Sun, 15 Nov 2026 22:43:24 +0100
Message-ID: <20261115214336.17917-8-arc@gmx.li>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112023720.1503814-1-mrwillporter@gmail.com>
References: <20261112023720.1503814-1-mrwillporter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GoMgzEyfjxZwfR8A7Hh953bqRPimIigqqNtmqFh//wzcoW5n+7I
 E/OstzwPY26eAJIsflbYNGV7j6Hm2AtDeBKofYf0Z4ckJwHNVGuWilVCTWWwwJV4jqWfVHd
 XtNLNK1hWW4DxsC1cQEJhM+ydAenbywqDZgN3xrHvhYh7N0vAy6e4egfTBOqpEk6zR2xTUJ
 xZofoeDh9INqOgMjwFbSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:M9iBiLr9KkU=;ObrZ/8aNhGBfd7j487YBfJcVZCy
 KrJxlzBNTu6X01L6VdVrb0gnRNVNM/vP7cRKczZKdw/3Wj3DZp1Pd6W4SFFFDJyCykjZ/gzWi
 xsdVMfZzfiShZUJH0n6yb/zEEyPHmDfg72H88tcC4dLfutot0INDnF1Ny2YsP0IhnpQ6ncRtE
 pz8NqXz8OMS5YBDfyJEpJ3dqsHZTKQvqFFHacUMXjHCwdAqzTsb1sS9lM5GWeX9eXWtkMugkh
 MLRbcV72i6iDELavo6FKIZ6XiXT3Z1Yj/+jV86hqZW08T6/mob29nDedakTkkX98pEjitcJ4R
 xmkC3ANLYY4G2kb+d/XOet6ZkzX2z9G+0vZ/cSIIWTpwOld1trjTMPfYAUWBCoE4H0aI0kAdX
 xifpy4HCRJi4r9NuK+87WM7c2Oj+DXIzXAQ/FKbbEKoj2zW6riGR3a1E2FiK2tmwd1qTCth9v
 Z0UKWX/VpRCUCMsevTB9wVESj/Ehc6ibzJzmmQcIxtZbey/O1fOHRSwlrog/t/tJSy/85vTgo
 6MT2I3r5MkyPmthMcUo4fb4Lyw+cj4uEyUa49pFKxYgaeyWoloXs4lX0ACaBAWUlUXhd4T3GB
 NhPRNjZasFC1lf05BjA+gNVsDzqvFl1Lsd19szc9ORWUtqlje1rUnlMfy1/NGvGrlOBPrwpOL
 e4RCqN8wtTRHzRTZ5Ob5Vu4a7SYSYafk0oXvlWlllG6FjQvg9+2qP16dfzG9JUiThXWqiZoq3
 j+kogK92G6Gjhl8B/pUOTci1xewGcKWtPueLNKGo8j8Ecnt4lsT/B3mGTfftatHz98e8p6k+S
 enTBnt5IosiLoXVTz3mEep2y+mF+tBheMnQ6fqcsk2p2H85kYe22ha+UtaIfo/cnqVM3Zgn+2
 vmaA4RpUDUyqmirRtfgqueiO7VgaQy/p3f7sWsmDA2K3joB2eoihBsbs751rmL1Skn8Vr3PGs
 kYNCs1SDJoOPE95LlOQYKKEGsFtNtx8xllbgofHQwbefXDabIJmbdLdlguBZIphSuzCBznZ48
 i28p3/7L9ZI6xMc9pPBBhG6Rc2gOh4FJyYMn3azs4BfUBzpGfldq77qzaudIuA3fUeodBAvU3
 NkNQ6jUrkjCaA2jdWD+SwHO80ULO83/rB6a89nZXtZXyNLlnO4tCJu99UHAHVV9vDFHlqMb8m
 zcZ4zvnDTd71m+giTjx0AWH4udQCVrwoOT90PDHiEzPSv7c+AGOR0XFUfpd8ICaKEZ5PwkxF4
 gBjSl7JBxYCEM7RBTHv47MrTacrmKAfscP0DUE8O3QPY8k8CTLOyF3Kx+gTdxVe1+Vg7PHafl
 7VjPUuMMXzRAFGIrwabhI4Pt6zuCaSAOucFsLfk2tA8p2H6k4HaJ/0mtCudY9xcven8aO8rNw
 cDWt57+LLypS9nA1VRCSawWTauQL3QhZxyZtdOwmyjUwAUvucicDuOyDx9ubrTHmGIYs+QhMV
 cN6oip4ZJk8hyczw70SBvtvqN8dYLs8kTOiJdUgOkCOmBGyK2UHp0HN/fVGzbSgIgXCiY9Jop
 h67NzbABJhORvRolvCmQHQqk6SqffjQgPwY1LzQ9dQsL+II6u/WTEQxYb6LdL7KQoDxxuyfdc
 /Eo61x4FqdTlmEjZxY9FYx+xrp0/l9+6Kwhyv53b4XWbiUROMTjKPCgoa2IIyRmIchMyYxQxo
 mhPh3g2UXJv7xfoMnTehY7vZHUZKPjwsY5ZEafr7KH9iwBDJiXNE26rzXXvEt/xxRbPItj+Ks
 aTJ4CLoXVAn58WCAZxkldP0/0HO8TbzpflG7kgNlLLOxWLIdT0WuZJ8iAUmEZh8W8DFa6jlX9
 hNlrCLCGoR9l0VJGKehxWoIIILyQsC/pNHqRMYWBRV9AMRVxpBqa/AJaRvx9gT9D9SXR2HKBQ
 FLMnkTmrGnJfxmaKJxe0ysjOgWth5ONHoPePovnqHHKMb0vSKrW8aKOi/KmOT/Y2KKeUOJaaT
 zqsuH8G02OM6pNNfpeXv/Hp4dYZwJBeju/KJxVCNkvE+gp1z2nnbw4gjUp7Z1sOWg80RTX4S1
 qC2zd2VJCrivzOjO6hRgUc5+6ijKGVo4t7k3QEi/Wn9ks3+/NhOanOUIYEC8JmQWk79hRcmJc
 Zi4Sa8419/evRH3fRBg3aK/2iqOCw4BwRcaDGYPr3sXgLl5Fb9alTpz1aU9R3Tc0XhVIF4zs3
 WwC0ZE2YftOvBfz8z7zFctW/1K5B2sF3CcxIumUJWmEUADrqDsxCBnZz0px87quJd3vxuuRMA
 aeezvX4Uxn3fFYg4oqsJ77TsQ2+aGWUOgFFQMkjJ1c+PGrRkU2SlR2yVwepWeAgK37YHic+JE
 Ga/F+I8B6GdkDi34ya33Yo8EzxdAdgyRdcG1D7lknPBxK7qISRYQclkQIO7QYjuFohkSKwq4z
 10NCrfjzZnoCrS4Se7gVnSJqu+Rjf3OXBd8GxFRhnhEbMt+nV+g7zixIeJ2JMCsSq2Cq+qnu6
 vvMTZd/n19CodJkbWWWuI5wQUktj8Ac0q6X350t60/Mqt5Rfx8HQaWvP35qKtXPI2WrdZEfBQ
 JLYJueh45/cGh4b6TaGsWcmJ/luiZAl+rUldAU2MiPchkyDeg8FKV0e2/2TbXsLDtri1sqX/V
 dfQ0A9TyhtqxSovG0GnUEJ7ANltOZI5/1wdZqHRhJARxylHZlaPqv7KQ1VBOMsDAmrGmvci/6
 Ue/NE25ov8MmUo6PqlsPtDcWGbVJt8GJunCcIB5Xz03VxNRaqI9GDWsaQgw1pPe3E2Z+PmANd
 DkjQwcHkdzUSA8mMzaf29AML6ynwReN4Vx9n9ggrEgdZjPhfkCzsSFVkz6Qsyju3MJaUc1UkJ
 qT5yyrtr+qfN/U8cKKXtpqUBlu2ovC+yu5gX9Y+9aaAzZImSkrrWilK2S25puUhqf3NBQWFkT
 97z12cTM5a2DY8ur9BTokg6u9hfZOitgixP0CvEsAl8B4/mbZDgytGLIBCamne1/mQN82HiI9
 SpRLFOpDhSbsQqEbARGqIv+j7FP/Cs0r4P5TvB6/TwuseIQo1llR0RsXNCXgNgQoM8w1IVq0S
 8QLJaKizTJ+5xZFxmdddjh9MsV+w4+v84Qh6WKq1bb+X0dgwgrZFP4KwYA7VRAgZbryU5PEMz
 URkxQq72j0SYvnpAeE3QjwGaWkl62hTUxjxHXden3ACgqdCsUwwlldJCxdRMh2ulV4h+PE+M4
 m16F77l4qVHzVL2LbZL2kejpFKTxHLXxCx2VLrKJn/+P1f8kHoj6CLnNaHsEsFaYph5CZlY1v
 ApEKAFHptl3oEQZux7ADf6t7jio4rH6tBBmcf2qGgZCCzGrlyEnGlIvjnvwm0n5tlh6aRBKNT
 hTNiCgJ9puBcMWuUaTvBWXnUPnm65hY4HhGzka404RQCnh+J7+0jbeJ9I595iysWKG3hkWp+L
 hYtZ7zJHSJVCllpFtRPEQ9FPUGVjd10iaEWI1EaNVqimVJsqFkkaFlXBK79Hb2x0jgCVk7m++
 VeDuNZpbssVJf3NBHTOTk/bCgurWMcJrn0Qv9fKgeipB5O3sEAJlOKYk6KAu3qRaHlG7Js7V+
 V3lryEv29OBj8IyoYq/vhU78kaWHnBFNpyOXsnlhLNjiKCxuKsEOJd/d2QeU6jt0STE3V2HkW
 f4HPWfR1JLES3TAB4SCywHsy608OfS5Xq1Z5kwgcysQFTHi9/50nec83bs6JKsZekQojRfTEc
 mCAbMfBLaWaKDl6sIATiqRvxRcC9shmjvO7fbN1ILlEHzIgdj/Pvu4AFp3MOXNW6fCQRFH3EB
 U+V+H9rlstLiEHSXkp49yYgVjqnV0YDO/i32aQkyhYoyIXMGZ4yj1UWjAWS1lrbxOacN3kF0y
 0E5VPeJYlaHzINXFOV2gY7hWChSqnPlo8CPzWcxhpRhpMU07v56P6EkcZoYTHUG/G6NFTCeJ5
 Y9jcFQzOm9HraunAj9Dha6MLJYR1V3tVvBi2efOMI3wRLswYLpMlsJUshcCytANDhqr8Apjth
 xekTmqxHEWW9F4p9vcPZatO3SObe0vbXVbyPMlFUL02hgsPZ7fHPynfT76kYtA7PiGNlEIDKQ
 1DLONWXdAvI4j2BFb6xsduHsj8ZH3OHnYy/zMMuY4r7TSnoCOdkwBDZsUiL5K4koo6if6W4SP
 k1kYnFdjlaWEy95+ciKzxXv0gXHn0trFTh9lczN3IIp+0rVKtygpGKBbNhKFsL+FxbQQlO3l1
 p0qg5hhCLCZl9zhhN3U4Z8AfESFkOGDLAdxADrRbhDUHXLYV8YYD6pBZPfOaCp2lkMnSYExlZ
 8sf7kL2uZjGHX5iOH+5w7cEaFEzTaleWqu3QgsrOxpu4oynXuwjGoIdqNfdRoVTxj95fVESsG
 1QhG1ANnNnSbZSJShlbymc+Tl5CLHdggaYBhdVAOF3MiybQSz1APXjnh1kVt3FsLld4Fjh3Vx
 DlsiEZ58wUR3S9D3J4uSb3R8lXHPB4PwAYUVtv4gv+u0PPJBvG58k9XorbOUY3Z9CLECw4WKC
 4ffQVyhBycZt5Wa/PS7jRxRtzE6TEaegChvg8f5Ss59aTn/BZsFXCQzbCYg23bA/6QlgvlgZY
 80Ky8toK3QLXl1TaM+uvm5/mncHsU2d7WfqSS6bW0LEOdyhjpixz8lNtWx1VApl97bNWI6bFk
 zlNK7rjX1AcmcfQy5yHhbgxqZuESv4KqE+vKqwqSr12HS5CH5XAcQVq0DfbHucvmvcHZLRvZx
 Lk/6vdy0ybimgsCwVmzvhn7S6nUTTuNLIQAzeaA96ngLf9xoqS98YnLnNxa1My7GLE40dgCWo
 9qB1ZW8O5GbJVfMk/LtMpWo47dzvHDJvVG/1FMtmKxbM4/E7QP1cRt8utMzpOa3cVL78oi/wA
 OSUrRUkaBRRHGXHl44aj9fmetPdLsjey2tTZlPqBsmxK7zdYUSKMLsJUdyJVNH1fwSKeqfZDk
 SkvknIHZcrR/c1yavrq4/B9HnJvfMrW3wavQjsDIRDob6grXXkaSJhtLn/RdEJEW4pzv8mT/W
 YYf7QATzunfQJtT0SWzVDiyl+SL0OXrjRqUWxR11AszBNlF51P0I0pEWrpDPU4Sn3qVM9BOp3
 vsH/ZqWS0kRYlruNWanLKPinK4pQydukF0/F8zRu3wBmfAzS8ZTCy4+XvCegsSawaE6ZZXFqD
 iWKHgCmRMj8yndS5r8Yr1ffTEY5+CVtWztVwf67uRx7/IIvL9QubLK6N1+Sdk89MkwYE7tlfC
 jfnOh8ojChcKoZlLUAbtvf80qk0R19ZLKTn51z8fBJ0jn3vwAosvqIccdscN/O2GJEhFlZz+/
 qiUZU4GcY/feyo1+2qOkQEvNCdUJMCwipeCw0FuoTEGfUOlHyjgfSmRFY2txI6asz5zLIKWna
 LasdC5KqMTewoa1xuKJ8MDDqbPVFDwnrZ+6EQaAFWBGwZhTIg7TCzpSYuqg0gx2asKoS8IDGT
 HpTRVGmuuj4fAL/QQLXEjQg0+qBIy5hr3RzmCyBNbtwp5g8m+Kfgrw4+XBX5SfZQWyB0fv7yq
 MmDmf84vxbTgB1bNbh20IAxp4Xb8HEc52kJxHfskLf73dyOp/1DJbgvaqX/yTGuE87uOql1xg
 4u2tPMr53/uhaxzVbuJct04M0FfSFWoh6iqopiO8FP8VqaobZvPxxSQbnLtZr2KzFh285xmds
 PjDDoOJ0CCoB6yimbj+4ERMaeQiQoFfEthr5HdNjRqANkH3QNvZP8bruQq+bE+iGst2HC0BW6
 +wRzo+axOQ8gFRa3QMRZIllNgVm+c9sUIW1F4UYbTY6dONzbFlD8f6NY3ET79R3j5iBWv12ug
 S7DtNHU8gT9ltlaGEj9AY8EyS2b/83ER5nBJb0sLsKfft2JEkBcUwtzo40lQ+Le2EtSIRYe+Q
 1w6+IvhK9m1rKC6JzSmChNbePfUAXcnhS9yEPmA3lw3qB969YWavmRgd7bR4lYogBlHEFgioq
 9wuZrl9lDHXT8HqfEJ7Xm+fLx9XAhyI6fhRK/g3Z4w612klZRvXaAUYpDW7A5Tu+dFTwg0jiv
 gGz5aIxprCuqo6zNOzyDi09BSjk9phFeW3a4baS2gfHtVgVTPgLUVk7f6pHLaJ0/Nb1MNZ4Tc
 rrGRlt7IrXdZAOsKd2Y6RsPLTQMBzsVF1GC8lUHtOeQPBmVPjKCQrJB0L5RdlfG5dk98MkMq/
 d7GxjBG1ape1KA8dyh+VuaR74e3i6VZ5QJIIY6UoEAWlWxQ6U+B+wzKjiADdxVJswY3Mziz4c
 ATMzVjkhfLSgSBadxgISmfSJ9huJ0/Qth7A1ibdniRznlf7psrhneoDiJoRkkwXJm/V/4N824
 G3rl1kja370QcCzgl2zfRXYOty6SN3gLBcaTdvCsZNswhh8fzomhAdh5QQq9zfp1fj7e6LxD6
 +Dwj+FiNOsZZ55VT27hE4L5H+TNyeHe8q4+fk9OX/brY/TEBzDze8Aw/0XrJN12zv9jdlFHf1
 t4Etx2MJc9BUbggB+pMFWnQ+b07r2HGuhU/IUjMzsTf9hV9W3zp4jU+pzX+pa3DLqUjr5FECg
 DnmiY6kTtFBrG8xAhwPTUgu+xHM7YFnax4Bb5BJrS2kojaSeyUcFw2jcz+uMcyuzkhrTUfWtB
 KwZslfQC7FgdGUl2slcq2yA2OetBCaXGtS1oL0D5FYCQLOiS0Rs+MBPl/Q36Hj0A3tGpaqfz/
 iSjARVXj09Bz6d0Oro32zu+oPsbHTZjgptbO4xvLKy580Ibv+wtPKrLdj+WB8RPdHpSESTaSH
 QZHL4T4aTueUipP+uSu9EHMsoYJy9cpN3ikcB9KyXj6b1m2OK3w73kdGhwAzi0S7KJhBRntAj
 m9GcCZebV5nRutWrkCTOyi7I3pCPQHfY/XEL60WSB3yp7Uwy4hxXHLbrNyC3S4bNL4kmX5Pvm
 fLq5XDFeGHpzDMHQ/0mEtifQDVwZbKQgPby2wrZpZfIXqnzxuqR8uebS3Z2a3nUlItO6y6XC/
 dV6h40JbBou0enb32z+/J5UPUStqIHzjNFCmb1mlbo/ElqG+AZMxAO2Kgd0tUyDuX9f49SvoO
 U10V+HC9VOWUL+hEzS6dTxRh8+GDpit/BF0Qu8z6qw8Ua/dqAiGi9uZ+cdEoFUam11VumK73b
 XwN49mYRgXNPXIuJgxWrXqtQ8j8p7cgcBFvoDrR1VeMJvILoDv7i/WkQAusyddiJHRNERwkXw
 EOh3oFeggAh5JfSScTEv3aqvhagk56M6NyW+s9lppxVKqLI9BLm76nxPvLvMxjPsuQmpwV2cX
 9bWuvGkSSkbKEWUB13sMDamMYAqPr2amqj/8qO0YHO07SMAqwvtyZU3+btEwAszIerNemmGaP
 JXKV8N+jrKWg8rSHgpQIIDTcKgMpeQtnPr2tdk8sgaL6JVHBy4nufPoz5+FCk1GZ9kBRDGEFj
 GgJnErgdq3yo3ab1DdnbrAfd0oSYtX8G5PYIShGin5ZWX+gyHxDeNojwWwI8rdTq4b9UL2Hv4
 JecozcCujsXaslg8QWPjJfQ1PcCPr9I4g5wpr/aRZ06PiV45sl6T5SPd5MGQOmgQMHgIzyksA
 6FUNyjIFGnkCw2eSayfhPbrHFsbH1i3NZHKz0Nt29YUTVEdelGtS6HpIP1ihZkJ0+h2XT49+D
 r4LYQsvsJrmbU5nzkOCQmpgA5wjhS5OrUKHaAp2wYdtnHZTCvc1fXQnGXHLSXDBCdkaUsyePb
 Q==

Add range checks to integer parameters to improve error management:
- Reject out-of-range write attempts with -EINVAL
- Prune out-of-range values returned by the device to the range limits

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
=2D--
 sound/usb/mixer_audient.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 4b20db9a82e2..433bb5479d8e 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -44,10 +44,10 @@ static const struct snd_audient_ctrl_type {
 	unsigned long flags;
 	size_t len;		/* datatype size, can be 1, 2 or 4 bytes */
 	union {
-		int integer;
+		long integer;
 	} min;		/* for booleans holds physical int value for false */
 	union {
-		int integer;
+		long integer;
 	} max;		/* for booleans holds physical int value for true */
 	const unsigned int *tlv;
 	u8 unit;
@@ -425,6 +425,12 @@ static int snd_ctl_audient_integer_get(struct snd_kco=
ntrol *kctl,
 		if (ret < 0)
 			return ret;
=20
+		if (val < ctype->min.integer)
+			val =3D ctype->min.integer;
+
+		if (val > ctype->max.integer)
+			val =3D ctype->max.integer;
+
 		ctl_val->value.integer.value[i] =3D val;
 	}
=20
@@ -448,6 +454,13 @@ static int snd_ctl_audient_integer_set(struct snd_kco=
ntrol *kctl,
 	int changed =3D 0;
 	int i;
=20
+	for (i =3D 0; i < hwchan; i++) {
+		long val =3D ctl_val->value.integer.value[i];
+
+		if ((val < ctype->min.integer) || (val > ctype->max.integer))
+			return -EINVAL;
+	}
+
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
=2D-=20
2.56.1

