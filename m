Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674957;
	b=Ploz7HdBlqW1mRC4wkCzBZBpWz/MaBC89NMHgNV62C8cxqlu+Er682TLB/5gB/qrQCIo
	 GM6mGGVYbbbMlW0SmIj1mIi0rRFjz/jrXmhi61e5rT7kbhDS3zQd5Vs69Tup6uTSjcBM3
	 GnecVYYickZQuvVojnuAeZ1ZP/EPaaBZzFA6LFjMsm6fufHZMmiqScGrQy+jRh1wF7uCS
	 XCn3eQ/T9va3knYnMD87kycnOfKC4e+8fReuPjSkCTK6TodiVK44tSo/SMTdyFIAsJzCo
	 56+1jJSr/PB3yV41mXyjUG4DTftendDQYSKdxYggJJ5ZviwqQdAqub9dXR+aljXNlbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674957;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 mail-alias-created-date:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:
	 X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=+MqhGtpViVg1xzaxLuI/LRkFUg+bXq2WVpjSwh8nGUU=;
	b=j0xPDMc3PyFzbiXt+21Pk5pt9rVyjcIwinqZxF94eWnSUP8cVq5FeAbuUQ8U9jL7qpdJ
	 FYHyy4WiJN4CAgE234IazVjD7YhEYCVplVPqjDcw1NeQqv42KLp2BBEzf12d5wPmhzaXK
	 Nj22w/wRRbGUQ1Dmp8qBzZEbljcHuYPDcOVlGaDCpRA/niduu60Or/FxcepfmAtYgsoSw
	 MKk3XYYqFT3AGt17UtNxtbuDsqduOIRvRd7p15a8D+MEpx1TQYi1l5tdU8Cjb+2N1EkT1
	 6fbkaPVGFlaB87bTFVI/JSQLb1jHFkaErZjpIi2OAWPSsafAcN+/eScj3EtRjtENuWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jayd.ml;
	spf=pass smtp.mailfrom=jayd.ml;
	dkim=pass header.d=jayd.ml header.i=@jayd.ml header.a=rsa-sha256 header.s=sig1 header.b=MrjiSkRd;
	arc=none smtp.remote-ip=57.103.79.51
Received: from outbound.st.icloud.com (st-2005c-snip4-8.eps.apple.com [57.103.79.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296A9606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 296A9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jayd.ml
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jayd.ml
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jayd.ml header.i=@jayd.ml header.a=rsa-sha256 header.s=sig1 header.b=MrjiSkRd
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-1 (Postfix) with ESMTPS id 8408B180028A;
	Tue, 03 Nov 2026 03:02:30 +0000 (UTC)
X-ICL-RepId: 01a19f5b-b973-7459-92ee-1f2fc5187f59
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQpAHVoHRQBEDFYCXAVLVxQEFVYtXQpLFBcVX01RDw8aWAFXQ1oHEgJaRQFdFwNXHFZFXBhDCV0FVxwdHkNFWxNVF0YJGQhdHRkIRx8KMANCDlYDQwdFAC0ZHFdQXQpLFBcVX01aAlZNBR1WWVVcAUldVQUOUggfRApJVUAOX1dAFBoGWAYIAUUAG1dUAStYEUAcHQBbVRIEQAhWUFQeQQRWFWwJWAZTGVc=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jayd.ml; s=sig1; t=1793674955; x=1825210955; bh=+MqhGtpViVg1xzaxLuI/LRkFUg+bXq2WVpjSwh8nGUU=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=MrjiSkRdTR2a9gR/ZDFpMwHHbxe3u4yn0RCxO1H66YyDhHKVGMHS4hZMlxR6ij5+XIHfEvqh03KSpKK1assYO+4fKHduLHo8m6LkNHh1VYIyacah3OzfVpFS5GoLHYpZ1ziucp4MOjeI3I35uDUGK0eSafDCdHJgdCHIX/tFkW2KoWTpCzsLluobthwuVZ0hzzxzxWG620eTbI6NUi4PI8/6wS+uTOuonwaosqEXaLkUI8nDSeyGyY3UjAesGvNDToXIIhQTjN/fpUPq3oEGe8f6zaNyxZ8Th+nIFxaiEi2g2pvq7BBKYxpPLMHF9x89YM6hnTNcsT39FRr63Tfx1A==
mail-alias-created-date: 1679885584335
Received: from [10.0.0.239] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-1 (Postfix) with ESMTPSA id 8D4F9180010E;
	Tue, 03 Nov 2026 03:02:28 +0000 (UTC)
Message-ID: <ee4b739d-6cec-431f-94e0-b551c359cd96@jayd.ml>
Date: Mon, 2 Nov 2026 20:02:26 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/msm: fix dma-buf sharing on targets without
 per-process pgtables
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260822-msm-fix-export-v1-0-917b3cbedd43@oss.qualcomm.com>
Content-Language: en-US
From: Jayden Milne <me@jayd.ml>
In-Reply-To: <20260822-msm-fix-export-v1-0-917b3cbedd43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: niJ2699BYEKqgQlCKqK9f6z576FoJaAe
X-Proofpoint-ORIG-GUID: niJ2699BYEKqgQlCKqK9f6z576FoJaAe
X-Authority-Info-Out: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=6ae94ec9
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Vbwzbr4kkUF1MwGzt2IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxMSBTYWx0ZWRfXw8lKd21h0iM8
 P+SL2ke+6JVzuscwgbjvHpG9kMhpz+bA2LaK2zgVLJ5QZNglJyIGpnSewl2lzyIiWavm4YFGZ1s
 YD5l0UdmsI7p/ljU1vWeW71rS/ZRcQaxpK98yvNvamcPRIXNDUSR/KXOA8YqT8myS7S6ed6XOaD
 vtDsd595K3jw/PL2yS6p1UIcnv9FYIwG6LMkBrqrDZ+gVINId063Jxkg21kdnuNBdUb8wGq1a/4
 V9YsLJU1rQXhyvb41WeKJIfJUQkqP152IpbzNVsrOCuFS5wsfv4SfCkknkRc2kYAGCoG5Mg7MhB
 aHaXzIwCyNb+r6/JU2wa4RE5HE9qWNp8pviP/M0T+lmDLYwJv64mKcbA6Z8HXc=
X-JNJ: AAAAAAABdGY6uQq64stNARv7bdWI5eEOuuhXlsdMJGdckKk7f5MFVbUA8Wx1+ShZy7/0mY
 ZsZEVdX5xoEBYoJR4CYnfOqtWPWPKMf0WsumXTABzn+Dd4qm9NIr8WlaCOlhDPp93siPhY
 wvAWoQRLrYB+x9LzU8PF+gx5cAmTZWlJPB4JM2hpVty28WuvCxw7kOa4+lXyXjmIxkVjQT
 Odn/uZWztUNNkSZfHFz+C3S+e6aledGV94ilOEj++Ch/JV8UNSsMpHHe+ysnKnrv5BBE0C
 4klNVW0VVqn67f05xuMGypSbZXi0yzCjj4tykP3hW2cRr0FA/sMDZBTpsdLDH+k/IuSvzk
 V2fqDt6t9QXFR5VOUAP4k1G0ER+U8kklvp7dnQNzz3pjoV9p4N70JSiqtFby8vq3kJbxms
 gMWvrNBNdKHsIrZ9lybAqD9j2AQUQjIho/haQTal6UHPbrPUzubvsF3pzU2GuOrza22irc
 D9WwDbQ+qdhbE7C4fxnkGaunpxgIQD1cHm6jibRo7R4yWCNsIvlSZO/xKOiGoXopVqagg9
 WKNEPmFJReIMA1MQa6lFGrb5cYsaYyMZhvN/61HYDYJYyrm3+t/whn/secPMEgAsPULA1S
 tfXtIcH6304lj8y5BcYdA/8RX2LWeO2BWArkCh6ECq7hkiyiIpvogQVaEeWfu9uyXQrz4R
 wYD4QZ1qkfp9GBcQ8ANaufoVlhbZdbkTUEnkGJYLWHSlbe5ANcJnEsxiKgf1Nb0G5YUQ52
 a1ubEp2/z61WYOKSbmv5+MF2UQK9+qkTiL+xqtqA2EY2sm3tzqzb9aRoc4XTY1Xg0rYcHa
 /JEephlCSF0Z9cfeb+WEhBILV5EOVMipNaKgIHbmkBZFqH2VKLpbAtXqLTgDZDUYf5pNCq
 FKlhuOGQ9LdvPAZ9vVASD9YnQDCeDekvZZVDzc+ROTpfdrZJJmB1nhuS+qxv25udDbhpRB
 EKMVZ8Ko9PL8jPxVDcSenpZwLwDRN64mEnxzA7rYFjPhXf5yMTEfn/mzjn+I0Dvv/Dv6sQ
 YrqneArkzbRlsJEComYTmi+MrXB9QqO8U6Y73r4TMs2q10yyzTncVk+hgxJF4tRLx+o5gd
 icRy3oMHh36LCSYIMHvMCqR38NpjgvJzIsTLSxWnE6NNhD7n1n9vOfbyjFjDt+XDx2THA7
 dAi/tzeiyOs0bz7T/v6vaZORvvLzuI7zaeDo4qEfDt7vJf+Nob3JmlIjmZjGTgKt4dB1c0
 qUcQH6QRwh8EjfqUs9kvc8Zd1InkyWN5G2P2YZSU2Si3wageDxfsqZQ3tE9Ce00r5KrqDx
 5uf1cYC62mZgUIur+GdzR6RC0O+SD+Y0Q3KxrwRXjZbyMNdTm13gIe+9fthG/CdcbwnUuF
 0/luFqkMQGpp97uGf4AKeKvIZ36IeEAJDfrRew5xglsuxn+wcyUtMhgEUriK6wriyc3BqW
 iH4Km4lkyhzohgXGJmz2+N7rFvIGk/rBbP2JSW7zBWZRQz1F6G86UWgvYz43qLNNZSYAJ/
 3cYk9Ej8MYXXa30SasWR/E49nkUw3+FAweX3zhrCskvoXmVw7g==

On Sat, Aug 22, 2026 at 11:48:57AM +0300, Dmitry Baryshkov wrote:
> Targets without per-process pgtables -- everything pre-a6xx, plus
> a6xx parts where split pagetables are unavailable -- hand every DRM
> file the GPU's global VM.  The rest of the driver still treats a
> context VM as private to that context, so closing a handle tears down
> mappings other files are still using, and frees the iova for
> immediate reuse.

I tested this series on a530 (Samsung Galaxy Tab S3, APQ8096) on v7.3.1
and v6.19.5 (with some backporting).

When I was bringing up v6.19.5 KWin would reliably trigger TRANSLATION
read faults when rotating the screen with the lock screen up - 1800
observed over 8 rotations. After the series the same test gave no faults
on v6.19.5 or v7.3.1.

I didn't re-test v7.3.1 without the series - if that would help, I can
set it up.

Tested-by: Jayden Milne <linux@jayd.ml> # a530
