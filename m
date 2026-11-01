Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564187;
	b=I0C2il5LrAV8KNr462ra5NHmdNo9268nvw2SAhKSNy9bQtnScDB6Y6KgS8sggkcsgmNi
	 ciyoNmIljWD6CSgaVZlQyU2Nuokt0Owkk2jyLeopzczFB/vbZwuca87ol/LBhKvyeAYOm
	 J29lOtKZ+b/4eB9djhUrpZu3NDSkUGRRSBWMAsZDU1fwjCqsYQ4FleqhN0AkqiD3z+IWU
	 lH8n1SSv15TRpAzTvOpqK5UkVyckuYnSqwID73y97aAY2/E2VEohWUCByegkemvdh0G3J
	 3xqr/mq5DAXrYkcddrIMed3W6epYOGBKC1xTIu7dlmvxuryUPXySs0ZQO4Hho/XxtHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fnaImKbqLYBJXkiqJyPVd4xYWb1JTBRTzOceydKHDRA=;
	b=gQV2gUD9mf/YPqJ4FT9c498AInFptgEhB5ugjPFxFX8U3LGiSDYaJCrWEi/m7AvZUgzk
	 1RlmJuf2mHOJvm6AmUWr54WSGUaKjj2Cw3kqqH7dnonsgo7CwZRYskD6wjlpApW9Zgg9B
	 OEbK67JTFcK5FaMm9wRy+BFh3v8hklywHboy2Y0rymJ6eVsbVvgtcYAvUgtq2bs1vIwa4
	 avnx0hsFoH4jFJfvhXHd0U5rkDx01/yMN+dNV+dNC46v2nzkZ3oMNI3F+EZS26ON2vKAC
	 v5EnnAKsx1wdw2SyMov4ENlNVA2QKfJoTAO8hkuOrV7rwYJw47WQF/A4xb+wezUUYTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=GkqXNSzv;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=MehO27oJ;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD015606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD015606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=GkqXNSzv;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=MehO27oJ
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1DVvZs2338454
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 15:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=fnaImKbqLYBJXkiqJyPVd4xYWb
	1JTBRTzOceydKHDRA=; b=GkqXNSzvcibFejxN1vpyEVcyXQnoG2isUtZLAI30wz
	1QDTXo02zK7Kpimay8r34ydldeU864kjqBvOZAz4iSG4x1REDnhkphyI18asI3E8
	ULSUlGqGhf+2m08obvF40x/pWwtLEkVsRHPI6y6kE3yx/ifyx2SprvBejozIA+Cr
	Lz5lVU8PvEU/dN3XShJhJ0/IKrDNFGiNh9G0q89GVfgid+bBYtmVVex5Wd88HLvP
	jbJqXQ3efJCLg7iaDyKBOcjcLUJPLBsyNuhPJPE0k3NGRQxK7Eoll3k1x/TMe4XO
	pryh3ZAAtvvIIR8uTW3BA4dGdJSF+WTQ2UrGNK5CBD6Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hnxrruaxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:16:25 -0500 (EST)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98c6374b678so2375466241.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793564185; x=1794168985; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fnaImKbqLYBJXkiqJyPVd4xYWb1JTBRTzOceydKHDRA=;
        b=MehO27oJS12xjlwSjuSHO8Q7PUe7/O+AIfSXbhBTyQ1dXWQhLJCf7DBCqL1y/D2C8P
         bxn8pOUTSVO+Szwv0AnKLoKZe1mGDnVFg+uKwR4rVvdT7hQTDfbv0Rwl5W7bsEafZOUu
         QPOHsGCb4vpOJWyHc7I4NxSQdLvq1L7DmulFOQK8sgCv+xByagXpegFlQyW3YyupzLGv
         szCPn3QFpfJEyJlss6KTGPvZlLpqSSwVBRyprIwmn0fP3i38hGV5FC9ngRFFIcWpbFsf
         LTHQ9+nXaOVXpybi2gGXL5Ayq61g2aBtOxyAvT06B0VejJCM2ln9fs7I1m/WmTTjSygQ
         2stA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793564185; x=1794168985;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fnaImKbqLYBJXkiqJyPVd4xYWb1JTBRTzOceydKHDRA=;
        b=hZv16yFlIieCWlsaxoDCHskL4mJhqmqedmMONIiDuVV2Ya/xt2KHzxF9mK3LEJxKE0
         lANQ9I9i/quRxxFsRt66+fG0N3y3qetdKCym3m9joj1l8Q/Zh9yyM2Q8FV+f1y6K22UP
         6klV338BthGVMeJ6eE1rPjDxaHBSOR1/IeN3jiMGWDwXtiwKHQxCP2SScA6Rf5g2O2GX
         dJl5GBIfT8ICeBrq55jFq6Egmf+AoezWpJE2/TuL5yn/wRqjCzvbzlXuCpT6kjIzuhoU
         6LOmeB0vZQFzXl0N2o7DMk5IWYJHbNcVtYyfwvBbWpJ/hYhB2gjtRwaDBF6wIT0NcTGn
         7J6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHUlAEdpkXVLEedu+Gwk5Nd7vLDMZhMEjuxvKJnE/oud2fEH33+SwqkieCxWegSl7VoK35FmvsWNayQTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JAibIELnK1KvzyvXSKVZB/NyWw4Chi5UZExx0cp9BiXfKo3by
	hHOgNbU8zrdz3cBfZPvQymbe6O0StA1WqRxAkMjxB6d8eU2O1beQmrGGcKgoFLhJMBwF+jwiS93
	bZ0YVgG0t1Xl/PVMISJVxKQVwil1AxUTHBct4CxyJaKrxZEG3sKHkQKlvCwT1h+GCVjGsng==
X-Gm-Gg: AYBFou26uWUU+Q0eUQpi3FigvyjcNwUuyez+OV+ORJoTupTUvEoXRNkUkZ79zIywzNL
	CbG4SLkXx/HwhS/LsqqqtZysFI6g7B7YvzAcq1iOyGxmrFhEzE0DGdsHBaZ0p9nd5AsNvyqz1rH
	0KvbKIT7IAPO3g/PKJWJ3gVE2vNWld9ptSKTWEPOVd2CMi6ewc0qrfSZvK1MKWDOFuzEI1cQZ6v
	0zzk+6V0zcj5Lhq2i+kAuuN0nHsMPjHdi1HnJBG+2E7wKlWcxes6vXiqEz2DMA2jo8eS8rj5R1C
	4rswpsKga4Zn2cbnVy+sPA454ndoseAjkmIDTvNZyUM2d4hTGsI2Py0asmv5ypPdU6O0rk8ByNU
	jbGhJZ2Sfa+LjLdLEIngyFuMvlzmBWOUw8XGIJZKSPtmbLyx647EaSUlBDAs=
X-Received: by 2002:a05:6102:3706:b0:7bb:c382:2ff4 with SMTP id ada2fe7eead31-7d0726ca2femr3066697137.20.1793564184889;
        Sun, 01 Nov 2026 12:16:24 -0800 (PST)
X-Received: by 2002:a05:6102:3706:b0:7bb:c382:2ff4 with SMTP id ada2fe7eead31-7d0726ca2femr3066693137.20.1793564184373;
        Sun, 01 Nov 2026 12:16:24 -0800 (PST)
Received: from [127.0.1.1] ([37.142.157.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm15661423f8f.23.2026.11.01.12.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:16:23 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] fscrypt: remove fscrypt_is_bounce_page() and
 fscrypt_pagecache_page()
Date: Sun, 01 Nov 2026 15:16:12 -0500
Message-Id: <20261101-fscrypt-page-helpers-v1-0-bcfbfaf6a237@columbia.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAye52oC/yXMQQqDMBCF4avIrA04QS14leIiiWOdUmyYUWkJ3
 t2oy4/H+xMoCZNCVyQQ2lj5O2dgWUCY3Pwiw0M22Mq2iBWaUYP842Kiy9tEn0iiBr11Pnis2+Y
 B+RqFRv5d2Wd/W1f/prCcLdj3Azc6aLh4AAAA
X-Change-ID: 20261101-fscrypt-page-helpers-1b2abcb14657
To: Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
        Jaegeuk Kim <jaegeuk@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-fscrypt@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793564181; l=578;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=HFPShrW5JNev0UuC+9A6DubMHhA5PXNmLyvbbz/XIR0=;
 b=Aq6xafZVwUVCj89spVsNjSWOWhpxnQ//IKawZA/X2rTDku2fMNvP7tqTt3Ypq3td9pa8yl/n0
 FHYZd/VtnBIBqDyiSNVRJ7+LDZKr91yN24ofVLbPTzOyJ60Lez66+xJ
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4MCBTYWx0ZWRfX1UajueVFH3W3
 d+qe8qme6lWYl49e8zkjEuFGvlD6KB4+2pMirFYSdFOgNgQVXQh9NU/r+Lf8ZF0jwXCfWsF7/mH
 jvqWwExzCYPNKF8upZwcTwYLrtXAX49IEaOm7+f001pFjx0NXbRE
X-Proofpoint-ORIG-GUID: VKm5dgwGdXQj-mcz5COAlLX44YCc4Flp
X-Authority-Analysis: v=2.4 cv=HYaB3SE8 c=1 sm=1 tr=0 ts=6ae79e19 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Qz3frfIdACK70Hl/8c7MJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=NbSN4xko3C3IRhU3f4kA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: VKm5dgwGdXQj-mcz5COAlLX44YCc4Flp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4MCBTYWx0ZWRfX+j9XlBSEPpgR
 LFxdc70UIu3rXqT/9XRqFGp+hs3iaP+0Ve4a+Agwr24fSBUpORNwliAZ18+1nLniDGoYvxgnnnV
 EvkRQayq3DtXryiCSNo9S6CQTYg0nxORxju3juL58C2z+QoLl1ygYL6dZNket1CaFWtPmT3jhaL
 qIgNVKN0tpazzVFuOxxHNvyKCBGzVI8PetY1SQ0nzpJ8JFU2He7JT6tWjYzwCba7fNbV12s6NAP
 wOCKtboj01LTRFDp0hQDxoIK7NgUq4bAzLxPAWWKm9ku/UhDU5ieOjuoiVf74n8PXcK6oMiytGP
 v+3oD5HN3Hd51RO5TEWq8GHXHpEuCeILZwWwxNIjO92SOVQ8CopNoQP9hi0RqAet96GRpAsz2T1
 iS2TSKRpLo4XSvq73rCCaQ/TGnVp4qzoUuiPAPW/6zx9SSpSh/ffTy98d0IGhiyYa/ty+1yKVDi
 /GuiXy8P+eA5AjJDxJw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11953
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=10 adultscore=0 bulkscore=10
 impostorscore=10 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611010080

Commit ef9024b5fca2 ("ceph: remove ceph_fscrypt_pagecache_page() and
ceph_fscrypt_page_offset()") removed the last callers of these two
helpers as part of ceph folio conversions. Remove them.

---
Tal Zussman (2):
      fscrypt: remove fscrypt_pagecache_page()
      fscrypt: remove fscrypt_is_bounce_page()

 include/linux/fscrypt.h | 21 ---------------------
 1 file changed, 21 deletions(-)
---
base-commit: 46fec1c3029b552ec63b2d01af9d43a386f043ea
change-id: 20261101-fscrypt-page-helpers-1b2abcb14657

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

