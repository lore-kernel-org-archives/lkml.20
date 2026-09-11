Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B46A43F091
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123780; cv=pass; b=W7PILcNtQRBrxWNZHLPoohk+yOVncP73Td7Fr7POSr0KVFoKh5IDArD7Kw/DQv78Zj5ePxjAkmnbVaWDf9CDAuRrJcaF7uZ24+Ue4eQMo8soDSoshXvotCcKjgrV4QmPZerDf7kDWcwdHDUvCOBBuTCLU8zsRqxXkjgxGd4mnik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123780; c=relaxed/simple;
	bh=ezSrAn9CJ7GjnHLdrzeGHcm7ENN3QID29LGU2q4vePY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnZH8SBU0xU8GhMWAVFEAfyr6lPAremMRtPOYjVov57tkxD48DlnUmtfLsgqs9UncFuthuva/Lc8R97LymdTa/h2dT8IPpYu5MV9539Ow2LjRjtOxn+pCNGwMCuncbEUBfT+X66DAr6HKPhHyoEwcq1o4cmllk2IYCQxBCKribw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6ulhmTx; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6ulhmTx"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5bso6152531fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789123776; cv=none;
        d=google.com; s=arc-20260327;
        b=eiAfObxAry1JSxE5DcjIeHw21OQAH1hdaX2gWOcDdN57IiJ08DwdTS11y18CWzW5Lm
         iZOkiRfp0oztQT/Qq4G6r+zV5yJR97GCOkb9Z9j+CyaoWfMUuGBh84IhL02ILBS8/xEP
         Se8tbMAEknF+R2EGqw9m5YpyRBCpCP3ZzHnhA2UVz2Ip1wX2sVYRePEw88KZ9MWH80gP
         IEI/+7uF98RubNKmJWZtD2hjpcTaG8ZBigQboL1JMJFK47jY537OBG9yypjUZHeZUHl9
         EUV6XzualVIeaXRrjOF2yNRsloDJzJuGaFttUSZE3pNFzx2vx8I3GMVszPdqIyYk4HKP
         4e8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ezSrAn9CJ7GjnHLdrzeGHcm7ENN3QID29LGU2q4vePY=;
        fh=ubRZCB8v0PnK7pN4Il7hepXSYOVTFRxaMjWL/xz/1L4=;
        b=aZIJYtdlYXosOSyuvEhK/J8fnuT8OyxSCFi425pNm95pFbZChTf0NmK4PwhAtPvfPp
         jK/F2oHe9v/ReCBOSkGPc40d9NUaBwYLJBVM0tp/oXGLx+Ka13ViU7ZlEJqij7DW2eFl
         ml32FFzXXlTfjLBs99FHMgWuOZQj08gEw7WIoDFpW8o2LLMxn6RoDS948aH3SDsYaY3v
         KG4nBMn1xyZ1WttlXEAUwtZhLp33KOTpbigT9PkJeF7XCVrVyphs0MOIAjQ9V5a+xj21
         c/+qlPhscAb+Y5HQy9C96/7RDo07hD6l6tv+7q6JBWQ++P05hK1tuqVoP2bIJcfg+cJD
         GstQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789123776; x=1789728576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ezSrAn9CJ7GjnHLdrzeGHcm7ENN3QID29LGU2q4vePY=;
        b=g6ulhmTxVfv5JLib3EYTsO8p4RLkpMe2c9CxsMnw8v9n2gO1eUQ719E7ieF/SgM+CH
         0O/c9rdgTdxSMePZv0lIzRqLw03gDI6exq9pBcqyMl3/qsWBD7BckcWhdPE80VUGxwoB
         D7SX1DGTPaNi7EMB0rNbnmSnTpOBEvuXqOEp27ZU9ehLtwgoZYsjf9IN/hlWmoEY0/Lp
         xrAu6ubEf+uPhr9jjoomSzCYdzSeF0r7czhqonntJuIsY9oUeYXPz1E/7WnroBWqf6kz
         UNt7ho3Ntg5e4zQV1AnrWrMo12G1X2dpQAERxhQGy95fAamCQ7ZZf10yB1VNpMBJTowV
         j51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123776; x=1789728576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezSrAn9CJ7GjnHLdrzeGHcm7ENN3QID29LGU2q4vePY=;
        b=sCn8nnaDiWCOKrxzYF0L3q7R/u2pBwSxHrsv7Ch95yLKsWyFXVnBDf9ncRbdQA7KVV
         y6QMEgGJO5Rvlu5yQuiENUY6vHYQp3YpE/foSskBpwMcpA8Jr2Z15EkQ7Np60SampMdr
         HD7YTl7Nbm/ZPwNT0wSXFl4LUFq1yuS3b+58mTO22Rz/wVwnz6tpGebBlvxSzF+urSWF
         oEBvuUBUdfm30UE2reovVi02/zwWqRymRpZIaXmFXNXwCtV/rqN2KUSKAsn2ZqDtSa9I
         jvKYwIyPGJq2MZ2o7pAL42smymEc3WMFyIr+9RKhFDHFnIhijMjn9yltGcxC2PnZhph5
         K6JA==
X-Forwarded-Encrypted: i=1; AKwUvBwSaoFiXNQkDWt0vPoBnFgM3vSbgMBd2Xb+p+g7zCIU4oQ6x+Mj11rw5ycPfjg77ShDAXfjzjrtucmvcbM=@vger.kernel.org
X-Gm-Message-State: AFuF++m1VT/ULCDBjFXsqVzooV6QBSbC6XNrTrTDy8tN6sAZUDRSnUAJ
	sdKShXcSeDNMsI7kSebG1oaalvLCm6gMUYHbvOKwooP/U00YwbqUjwKg7dqCROJ1LIVP7AkRQ+x
	QfYpBH/BSw7z68FpfPlkMGq8hiGYl0HE=
X-Gm-Gg: AYBFou1/2NDpcdDo+tZLUzPSbEY/SMuKirgXZ8sNI1WYG/8pQp4mTIK9AZMeif+lPef
	gIZmhi5mXQTq8slou0eO/FyxnRSz6095a1sNYiD1AdK+GAY5zqY6kZHO1e4gdnA4oFfZDQpp7+5
	YODGSEh3D6xS3gsy5YPw1R4YnLc+TarniTV2nkvdrJ/5IttOmZf6p7uvH3IihzfsrVBuYTRR9Rs
	uhim4yB8izEfm4DxAObdGVADnmCeNF5HNIaBPwbKyi6Alyf8WU6aN3vDzv+sINJtkPYkvxANntk
	6Udgz/T0rsyse3VFVDopNsHjEW0lqPO9Ixe1n8EACA1MQu5zhnyYTVgGD2Nr1csG4pXeX437Hv/
	IafOsQH9+5cY=
X-Received: by 2002:a2e:bc81:0:b0:39c:9955:9e0c with SMTP id
 38308e7fff4ca-3a5a51ef765mr8895901fa.6.1789123775747; Fri, 11 Sep 2026
 03:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909133247.113923-3-sigefriedhyy@gmail.com> <178904820206.219967.5313952981588630189@kernel.org>
In-Reply-To: <178904820206.219967.5313952981588630189@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 11 Sep 2026 19:49:23 +0900
X-Gm-Features: AcwNN1VW2hCRe9SDtg7vs6h_4VOh4Y_U9CCUKTlYjaVlanKSuOtZxvyADFn39dg
Message-ID: <CA+7S2vKD8LAkRCuBKvZRWAqfGwbOXLEGch0V28v_p93Dan2uPw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/4] rtnetlink: add AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:50=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260909133247.113923-1-sigefriedhyy%40gmail.com

The comment here is duplicated in previous version.
