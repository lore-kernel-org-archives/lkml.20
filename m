Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.6.128.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953703;
	b=sad0ZXbPXcqVEgqqnHGfjfY2tV1YQmwmnXyflBXbpoteNqtZHU+pC/AvaX3U1gFiu+N8
	 xzTQsxnAbOXWmKX1sb9d//q229tn85Gh+tsJphNXgUDbVATDcF5QAcv94wDay4x0bebDM
	 Rh6d7YaAorDrRgoWSfGUv9MTaq9OeQKv99lHehcnfkcR6U6GB1pICNKraSATOPuh47yqS
	 Fjwtdi2gimRgN0fFQ3ohEE4Q0XDDCE2dnWFSWG6vofSVnKnFE4tZdygl4kQwvnLDJ0lHV
	 f4i9PthualGYpHmEseIITpejHNJELutyqKcIhb/LcrNkLUjUSTkNjJlGyDe27HlqzBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953703;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AyrEz68c4VXjkE63VyLdaVtnntlu4dIYI0ACzIZ48uQ=;
	b=lTOM8Lq2MeOgDNW66jKOs9E3CoORSI6cELkHI0vEaDPFcP3Kji8ZYz4AwHEXCjGpNP0G
	 O9galAD5az2IwWufSCUZkqdYKDaCT3+fhu81rX3MBeMIJX/ByK+wvjFfZAYuY/yfgPKsc
	 Do33wU7B5+XFUvTkTa1+gDiNvM574DmmNXBkXgRjV9i5yJkrHoBZEU9AYJFZMzW9X3Rq5
	 UJPGZFnsoS3lfVeYAfhAj8tO2Xs4nDn2AZBshCBwhKmClBDdhoCcpiiOHUszocwfaFZXO
	 FEmfvm+NFc7CW643Njxmu4ERZzuZvu+apU2DqRcpVb74BUSmhSM0g5hQJeQ+pDSxJuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=TuLOvMqF;
	arc=none smtp.remote-ip=74.6.128.82
Received: from sonic312-20.consmr.mail.bf2.yahoo.com (sonic312-20.consmr.mail.bf2.yahoo.com [74.6.128.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FB9606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09FB9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=TuLOvMqF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793953702; bh=AyrEz68c4VXjkE63VyLdaVtnntlu4dIYI0ACzIZ48uQ=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=TuLOvMqFAVxvp4TRoiBRJzzXf86qD1+billAbVMaCX4HtX5egU3Bc8kjlCbFfJN7Fs67I7/RMz885ioITdU1HORxtv+xcf+fUbfMIt4jUBOWA/Ac+JAGZuCkb5MNLOYoilttofdFRC3jBr73pOGMsJBPiz9+akul/K6QZWdO+3an/Wohm3cSVYwXSW2AY8JhuZcCO9qidWamLrQxOinsMYbMYaT6jrQArZ5Y2DvkgktAEYwqqERgjjCM1YU6uQavEB8lsigxCAia4TryIsEnIlnjqIOu4u0EFtBQRiOggQUfRGbVPNPUQ3WYLr7BRN0XLxW34e717Px4KYJO4XjpwA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793953702; bh=ll9/EtSQe8lPn1juqfwP4UnDM3itVGpehm/EsO1dCZF=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=BwY4lEDqeqLM0SYEVbF2DpSvR0XrJFtwDTeNp1kuUrJFOl8ziSdHLBx+lRX7RsPs8myT9PxMF3wVYBM6iRfvV6Qdr2GPivHOWOwTwGjq7UjiSHT1AS0CrwLuyuSniNVoV3rwPJtl6gZJd4FKhxW44hZseuZVZpioGUwvJpgwQHdb1nmdjwitkfUVV3GYquaGoWOSiZMfE4g1rhlS/WF3oesZLmNAqmaZStHdukvOQqO0jE6ZFgxCN2xr4daZqsdyxT97jdGDiSvjOXhvehAF4b2IDtdOLJFq8afWt0fW7JLhFKH2JylZkqNQwWWmM5+EnphqLBPpCC6QpEq2FaRFsQ==
X-YMail-OSG: 9AIiAmoVM1l9jHphb0ZchRqS4G08oSc5Ajgy0HtQNo0cwh4wYldNPq8YFFFU9gu
 VpPNulzu8rNOX5nWHV8BdEoqOhlVU15JDsutcBsM6VByAGHWEuPHZZqbUgMP5O.jF84X3bXW.5d8
 6Ghy.yJo1Wm3sbon.fi8ZKIAKIinIfD8Vi4axdG0xjz6b2jSS3uk_cmd1NyBwnalg3T2X8sFJt6o
 1RUEi4hafWV0XpUERmxGLRhE5D0eBQkJ6aSzhnHneMsGU4mMUW4J0nkxv9b0q0fNMmUxkpKwMFRj
 mzeQwz6E5u_aanbylkychAoY3Um7.OzzLCLgOqPI0JiFI2F4RmYELfslYr_krXXVKSusJFz1hb0w
 vme38oAHK.5jO01ij729Kqve2szsj9Whfsp8hWEte4FH8LGkaYiiL.3MQ89iK4OBGvDo6gEvibty
 A.1uRjTQdDyKQsdEoOk7d.toDSxpnxV._DrM8ghXr3y0tbh3V1KaZ6Ca5ri_R.FkRGRHT_ALY5JQ
 jrW67ct1fSSNNiBgU6VzK7CLSdMyRcDyYcanSWiZFuaLgrn4hiMz3j8Zr41TJEMiHnxEfpCK2cm4
 11d_T7gU8ochaXfA3HgzmFh3FqbRV4bcvh_1Mw3Wsl66cXZ9p3H5T6Hj2Jly.ouMHM.MUpKxvYPf
 9VpQZq7Hv3gZcvwu12f8bJn1ZwBt7aZAbZYfY1udgBpn6cl9DQfWzUEpg7QenvAqy2CMYglKuPvM
 41zdBHBZDJPRLE5JAb5eFgf.i2wEdewnhYWZcfClXelj6ZnQsqHSjETryQArFXoLCxKudBSAsv40
 fOwC7Jw78amBrUKGPbHVedDdaZCPbArPDAjcJL2zbp_OYkTUj.QbOPsWAQpUX9cng4RQICVyJSjr
 ifog4jWF1GNjx0Bx5STlmCpRRmiR_ZeB6epIJgW.MiqLZzBblGbyR2XzbmPuwVXyd2r9cUVpYc6v
 9SXsVxB2CzIZp8ek2cAk7mIzxuUgfMGL0AMFYSKONVxhBVgl2hoCPH4La7162BPEsQaAavUCqrwn
 r.Az8TN0hD2QpTLkReIFGgWuCkCJ9azWRlup9hvWX63OKZzAxzXOgv_NzHJL7qGdPZ.xFGyA_YMk
 z90cQQjQw2SqdinG3U.xGGTa6_TT4sKr.LVBt_ztilEtbznDtazVXkHdsilQsvkLa2EQ9RAOar_m
 B4Bz07pEO8XjkVQWPCBQ_9CT4sdnE8whESmudpA1Pl7kkkJ1Jpe7EX508P40wPWWEgP3mJIhgeid
 MQ6rrB08hTFOIWQqBw4.LuRHHBrZn9fken.a2sHqJIKfcY5Zta0NZ0pmsKELIYEZJ9uUG8kJv1YJ
 E0j7bNOT2vMvHyoQyaKSZmgQaUXKQsv624kOpdxxia91UH6BuATitfN.df.YF1i7nI.SoIZVdVPi
 9agXb88r7EdgvVV.SpEDAmtYniuoxWoohhhECFNEsTNbWX.IQ49KUoUqufMku.MZ3f0FLVNArht6
 90WTtemN4yoeMmGUkHNXOWg6hhLccvQYeGXHw6m5YptztOzKKtpzEZv8c565RBOXdDqsPTTFnLaP
 uZJlISCuxOiGRr.v9Z.SbK5eziEGmo9XsOrIIO8qXzfnBPVBqLnv3EjPjPxisRhKxTun6Z9cIkac
 ucQXB139uaRxBmhuNfZ4kHap1NCHeR1mqnoH4.DdXBMdSmyg5v57VKmmsh2Qsd2t5SKu.i0A31rN
 8FIFwxCZ8xPYC96Zat7ZBlYVXag27rW_8771yglQwfU7G8jmza4Jy4OEi8.1DQXj0kD.XYGyssIL
 UfsU9mGSHxVDL0xb3QX7H7u7e_sDcxGTkiMMQ25dxhJ116uOw3swK_9wQkHY6xoBof1pHw5wbNxx
 YsN8vA2yMMM.0QlUA0H3AdsrG6Xb3F7oTIqcfTjpSu4oauFi3i_d8wRTBUm1HA9xwKeKNX3KiACB
 pursb.lomZSAH_xvY3l2U1JmijajqmIAhXS0YGKxfKZ5rnWsjR7ffLz.BH9K7pb.teVMoT_LDrOi
 RBD1CGT8qB2Fu60ZKy6AleDvIVGxXIqzkHvM5JIlPGgqtnucUSjmg.kWjIVljgyqx6u2xBx_JWtW
 sQoizicdanRMvme9Rf7uab.Nuibyahm1wahWDB92NvLNOwG5qj3owIDvuhLyrczbYon_siyh7s5W
 vrQM5MFiMms8P0T5.elM_mxBuJMsyAIm8vy_ss9zECZd7ZlCgVLcS8BHen04KAlgbHLTjqRc9Zli
 FyRmIZFgiC8DJE_FRGTfmn5iDSuK2JazhGO5xT4bF0GmDtsfwvMClS.xTwwdGFDWJWGA1.wCb7Pm
 Ki9bBzLsZoeLMV.HI7taAu7mEKGapn.plbtUjBWUMVFVNH.N_F2jfDft.xetsmzkK37f6uQ2adKN
 eQoij8q7Bf2wM
X-Sonic-MF: <laurian.iacob@yahoo.com>
X-Sonic-ID: 028e7991-cf75-4c7e-881c-e1bdadfdd0a5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Fri, 6 Nov 2026 08:28:22 +0000
Received: by hermes--production-ir2-5dd9bf4598-xpdvn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID b16bd38e526c6a11bd1e2ee5539bf549;
          Fri, 06 Nov 2026 08:28:20 +0000 (UTC)
From: Laurian Iacob <laurian.iacob@yahoo.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: staging/ipu7: use guard(mutex) in ipu7-buttress.c
Date: Fri,  6 Nov 2026 10:28:18 +0200
Message-ID: <20261106082818.2293-1-laurian.iacob@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <auxWU5QgfZ8hrSAH@kekkonen.localdomain>
References: <auxWU5QgfZ8hrSAH@kekkonen.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

Understood, thanks for the heads up! I will drop this patch and look for other cleanup targets.
Sorry for the inconvenience, this was my first technical patch, still learning the ropes.

Best regards,
Laurian
