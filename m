Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289592;
	b=tNFqLAuLCcbU41B8QIhDHHCoNCZYi08dV/BTS/w0eGNRiK5XfbMTuOIA1uqlbJFB7ehD
	 dLEbzLwuJE8436oF4xWSLI/r7Kh0HLM+DSi3fQ5kkD4NwjeoOlN/kwgg/AHqyLPs84pVc
	 KUje4a52LInOCcHpH991MbvWMZx9UHpYTQkjiVJ+67PPwgsBclxz4Jlgwj6fdPpo1vigB
	 b6xhkA5rWeDgBpwCgi0xmKuP/gv3DAVPZouHyNBnRlGOXTA09aE7q4OO/cDyNQwXDaTJg
	 sB2SMxxjk9tIGC87iYPk/hmCTYnKbWgb3mhd/34qkc9P3/JxJzdtiOP10nXjzgRgEoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289592;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KKBOz4Zfk+6m41vEtS3t51T/FKzgULQb4qqPsWjpkDY=;
	b=5jVScc+uN9V7jXLUS/FqRB4eTlJCL9A9OaB4pVHLc41njJE2GxXh87GMPx2svoJlo6CE
	 4r+9QK5H1u5LQIcmp0qChKpAB6MKLSs9EusCLd9wGkGExZBp6wtwinzTgsHxHPWmmSOpk
	 J8wAECyU7ONZT+HhPPB06QaU7XHPGfIAI7osog5zWTaFmshM4uvLiDR03v3KNB6xQbT6A
	 nshrfHHGxTeIyt/qmG3El9nJD2ZGrn/Eom5fHXw1EQyN2TBThv2fhaC+ELzf5+/k9qZwH
	 OVtWIRmSjZ8F6d9TJI6Ob9Ck5GHdJ9oPQpN5A1G4ovLAJnApAjU2N8QgbLVpnuu7oTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pobox.com;
	spf=pass smtp.mailfrom=pobox.com;
	dkim=pass header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm1 header.b=iWILWxZm;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="Wv3f//OI";
	arc=none smtp.remote-ip=202.12.124.154
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC56606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FC56606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm1 header.b=iWILWxZm;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Wv3f//OI
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 902627A0056
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:59:51 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-09.internal (MEProxy); Thu, 29 Oct 2026 11:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793289590;
	 x=1793375990; bh=KKBOz4Zfk+6m41vEtS3t51T/FKzgULQb4qqPsWjpkDY=; b=
	iWILWxZm7HiHP5NTOMqiJ/QnMEMQXJNNW0oz8ui0Kmg/sbq/PoGdjtNLEDxiTOLs
	9SPewx/vJPnF+9z0+zp9SDsP7q9Gmqs7+grOEBarhYGDIsnAEph5ysMlGBQ1ROZA
	Efs55h0rEuS8dYa7PVbidLx2OhU8AUOVIiFPoSagxp1Hmt0c8k4IpjxyfCWaSesl
	7d/1zz1opNP7dR9CI7j9C/lJgYYpo6FxjEqO6kgtpO8LwAymjxOskDgThxd78gyJ
	yQPbN5x65vvNElS/hq4BXoymyZcqi9OaoDbCJdPfBtj2hY274MKo+J70zC0auL6y
	VP5rSuYO7GLTn8zw9L/0Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793289590; x=
	1793375990; bh=KKBOz4Zfk+6m41vEtS3t51T/FKzgULQb4qqPsWjpkDY=; b=W
	v3f//OIvKbfJwdE8tAq9ewB8tIF8wn/n9gysB0cAV0W+j/W7IFHcMDwVWhK1uFql
	X325+gi1xFs4M0kAd0P+2gVS+7v1tOSY/dibnv7oejvj8xksR3lKNQk6SGp0SU67
	NjbOLFORhQIy06F6ZLIgLQCTqEgVeZ3rWHjCHoUpwDWhx2mW5UjC50v80wYYgUqj
	YPe1sdCt8KeD/U9/uQITiFk1KxrHtS/eTUYfKWrO+DbIqBemx0qbNR/pvoMmQqoh
	Oa2lWZ/o3wdu9cbXCFRsfqyces6QjOyzU+DOwlvD+hP7MjGoU63jq5ner316jLRT
	Bqf1JbkMTecIeCaHtJv/g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pobox.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793289590; d=pobox.com;
	mf=PGJhcnJ5bkBwb2JveC5jb20+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:ELfcyfTePQj4XeM+/xIx3nht993vVDg8x3ICxAqiMFLCh/z
	AhSNQ+pbBnfC4UKP4rk20TRaUZ5cNJC139KvcAMYQAawRSsfeY/CwHMxoYaeI9/e
	u2twqBOMPnceOi4qf9rry+2N8eTnFG69udb7AFXp25uWSxg0VzMuCVDS2hbKd6Ip
	ALkyUhmL2Zcfa7i37zTADJAIwXuAFakCnxqwM4TrhXTeqbluTZYlkjB37tAMw0eP
	8Qfmhj7hbUFEVYEpg02wRQPVSpO7q1Wzn6L67TWGluTKFttkqJGzogAYbb79qiCW
	nR6VShLV8/hhBBGL10Yde27PCUCM7jVz3jlFIyw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:jFuKupPVcsvJ3QbHOK/1yHyTACi/4we82dXxoT3cHqs=:fyY3jBioryK+3UiLTqRhbOhIRioQgIN+/RdaHrP4w6w=;
X-ME-Sender: <xms:dm3jas7LaUA9EVUs0SBpgCAF9NaMXQUiLPVnfNaEcSMOy22_haY6YA>
    <xme:dm3jarnBIgkA52V9wX8TCRTHDO0KJxHEgBSnEor0LcEI1L86zPV-lN1LpSFgsP4AS
    leJuolGQBDpc3-PsoVGMHuqrcQByVmQF1xVjYTUuzuLzhGvYSFYejpB>
X-ME-Received: <xmr:dm3jatOb13V5gxjVsL2X9rl7KNV8EACbtFFDtgj-2UQL4SDw0DTketiWtIgF02GhiN3m98mU-vrhzoQuGVXzvgk59NrNZVoN>
X-ME-Proxy-Cause: dmFkZTFEDXEO2ZoCvDmzlItmMWHToxvfc72qCSQgltnhAXdPW0xVUHpSa1ExhL1s7LZh99
    eTMVhp2eAqS3rJG+0+N1o0K7z3MtMRog8FLrKg1UnshtbaXD+Xg3vyw9J+eKRYX77E4KMg
    shq+tbPtV5xrXACry2Wq+SP5YM+QKnGhSFIyayJGMTCfGnACfJxxlzisLnR+qynGcuHfE9
    5ol/ZUkRxvhA7kB0Rakq56OQF/qpkv1/8JFawlcXbft2WjvMPUsLAz5xljXC1FaRt1+Akb
    Msz6mIwKnj7pyQuJhHGqp0akAcj0yuHOxkOyYOEDJh9xhx8h7d/u7FC2+1ptrPyHA1WZIM
    G4Nr2UB3+gOy5hDWTOvt+sWefk/2irobWWfOAAstsjYjDrIyx/JeLnVvX5SMFpb7Qknmpw
    KQYL2swBwH8NcN7yGxrm+wZoXKad01XCSDdhs9yTvoz9PA9cdFUwowCtRd1Qf9ZT3kJd+a
    GqOtCw4VTDqpNH0wXG6D3N5dBmqZ3tiRKQUSUpEpFIeJt9bk/u6da0MZo7b5coIAyxQBTl
    qnYz/zDjyPK7w5cNKVY7YOnxObbLT/QzCp2AWnmAbjUeu2vg2+L7p7cAixyc92IcHQ3b0y
    X2/EytrU4sy2aB7UWOwhXq4Ir90orOvAu7w1pgHvjvSdSQFPJE8PtfUXDP8Q
X-ME-Proxy: <xmx:dm3jatqjvP46X4j9vQuEO_JY-cEIw7CVnguR1AT-kEGn0HCw6mErdA>
    <xmx:dm3jams228rA-HYQkyPDNKsSoYnoPcsJ_S_Q5usF_6aELpAAaFOjtA>
    <xmx:dm3jah5vqFAAObGvm6dzGtYtbW0DscIa1UdO2GOrMf99gt6pnv4gMw>
    <xmx:dm3javT3QuljDVVYQguYC5iJpB22j-c7w9FliWRG4DA1Lyrym85Eug>
    <xmx:dm3jaiXcuR8XqnM35mSth9DvUv3h_lKmrJPw-XH0PzFkXiDYzkjTUCz7>
Feedback-ID: i6289494f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Oct 2026 11:59:48 -0400 (EDT)
Message-ID: <9b9685ce-1d28-4d83-ab8f-acf29bfbfca6@pobox.com>
Date: Thu, 29 Oct 2026 08:59:47 -0700
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
Subject: Re: [PATCH 5.15 000/571] 5.15.224-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261028170008.009143722@linuxfoundation.org>
Content-Language: en-US
From: "Barry K. Nathan" <barryn@pobox.com>
In-Reply-To: <20261028170008.009143722@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 9:52 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.224 release.
> There are 571 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.224-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Tested on 2 amd64 laptops (a Lenovo ThinkPad T14 Gen 1 and an Apple
MacBook Air 2017). Working well, no regressions observed.

Tested-by: Barry K. Nathan <barryn@pobox.com>

-- 
-Barry K. Nathan  <barryn@pobox.com>
