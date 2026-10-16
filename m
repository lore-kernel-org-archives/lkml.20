Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB318287E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792109732; cv=none; b=WR9pk4McohI/0MnpOR+gRB9OaDOL7m8fYSuaSC2XbogiIKDlL5XgOB3JKDobjZFd42eqyZ4JPNfuC4moFvMoAkwhGWZdvq0EearZAzVvv846sB7RVlpvdrJ7w6+U7ZVs+9kH7A4AFE6zlWPJDJeaxruw3PHLVgRAS9dgpE37zX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792109732; c=relaxed/simple;
	bh=+Mg4GKIG7vBJxh3Spr6i8YJoCnvsDKGxlhwXDi5Dpfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MVNw9wOduJBf9c+uVUfymnETAyXxfE+biQ1+H3wdD3JWi2m9jgwFB/nCEFlBh5b7njez+lO9IswKAHtmep1eSkZW+/QGk2Vd6FfNHxiJwGgTwFlDbrtuTQPNNccEv3V6ppJQESlKYFyym8rvsXV/VgA+2b0U/FDj20Hhfj6p+CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=ytBAsO4R; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="ytBAsO4R"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2523506a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792109729; x=1792714529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qG3Z5711Og3u/lGH7QsJENyYY+NO7dBeUmZ2sJ109RY=;
        b=ytBAsO4Rqh3MCtIUTH1vkaCLST77OYPjH5rXiTDKSLeNk0Sj5V8k+RNYZqLv1J19HW
         0+ke1tyhfudsq62JWLBXymWtzvm2ajDGptUMpByc37KaW9JTfp5ALG0TRt2HCsqOtoiZ
         cwHXdo2HODd27/ZO3Y4pzjDWAW1sJGO7nzm9o5TsSusfLhu+IqQhuAoKDvzmL/WX3hBq
         +vZzRSbv58Dwz5BzqO3YLCK8nLKCu4S+RNYrv0YmTOPByrtWO5cAde09fA1tdDl9OJ6T
         eQWRFtSiWzi6conVXNpP1l/aqpZQisiFXpHKuNmFMqIaI3l7uKht/vhJzWJ0Hujh14Is
         gCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792109729; x=1792714529;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qG3Z5711Og3u/lGH7QsJENyYY+NO7dBeUmZ2sJ109RY=;
        b=DgX/dal5i6MFyMzj10JAcYYrWTpvp/ZDrZlJUW1EmVbmLZjzSecOVrqnTkFM1j3ln/
         otd21nZhxl6bPNnjYv4nt5u8vqpjmxjveP+fi5Tc/g3lUPQMpjHu/7sSpbT2sCj4XtGu
         3+RTH98zU9XtZseC/EHFlq6LQYtQmiFkp/wleJzMU18L2NSl8rSzGGybg8XvMqVoKPJL
         zTA32dmutRKJGap4lqLRYQTcOjiRzoMAHeDg50gs9BWHzmUFQc97mp52mW8rhK3a+uh4
         gJiR+z8mHMicH1JicmsGHKv2OQwffqTuAw/xe/D252gfmRJEyBsRmW+PvOO7JSddI0fz
         oiyg==
X-Forwarded-Encrypted: i=1; AKwUvBwaStzfqhlzDejEnERY/++KBgSzCQG4PNprW/Xh2WijYadyyVfIt6riqreL4QnYmMz7iZFVOKJKvFct6yE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFnQST01+qo7HtdOEMjdnL2raPXpMoowosI/hTmIckMepqOJ2s
	PuKt1/VTEItlkDVgX6eo3YyD0CZupefprUi27z8U89dJzG36xMYshugwDaH/K9VGtMA=
X-Gm-Gg: AYBFou3Rl6agUJnz+uaChZleVQ5yn0F6Yuq5XAN2TfVE4u9CtBsrqSVtJbeus0vP88Q
	/sIjoL9vz68sK1dbbYhRghrRWTEX/rw1N2WfMgHuIrG/3M+ur/6IoRtzmwhVmtsuINH44fBn8oH
	4hDLCiUEqoJqveybDbLhjX9NHTLzhjERm+OrEG+wedG+UmC8pDsoR/+I3bLUM+bhB4dTp5i1G5D
	65dO+tloh7QfpM/ehvRfX2LO/Am0G6UlBrZEHodHTmQ37ZutN1GTDZyMDdXGMjqqMVwGdz+Ni/B
	V/fKQpLD5EdeUykO+/GLiKcw9WzdLI44G8PYSRoy/b1/wb+wEa3v52BIrWwF+GR8Y3bIchEOR7z
	livsjv8HQLpBITSOzSuGk6KS1YcNgNOZ39OEtqYOarSCvlU9e6F9Q0mg0F45NhYhg3babrkFiUJ
	VedY/YIKHSieLEDSXNka6BJCsX7U6nKo/Wp6JKhFoW0Fc5XhM1pGrGyX6nyoHxXM9ktmF/L+txy
	qsVBC7quyYXSasr
X-Received: by 2002:a17:90a:1196:b0:3a8:a1f6:3b32 with SMTP id 98e67ed59e1d1-3ab423f7336mr10912239a91.38.1792109729218;
        Thu, 15 Oct 2026 17:15:29 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc487cccdsm1311466a91.8.2026.10.15.17.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 17:15:28 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: Re: [PATCH v3 2/5] scsi: aic94xx: validate the EDB index in asd_get_response_tasklet()
Date: Fri, 16 Oct 2026 09:14:53 +0900
Message-ID: <20261016001453.232046-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <06bbaf40d9188e478c4b58eaaffb58139839d217.camel@HansenPartnership.com>
References: <20261015091747.4184349-1-yhlee@isslab.korea.ac.kr> <20261015091747.4184349-3-yhlee@isslab.korea.ac.kr> <06bbaf40d9188e478c4b58eaaffb58139839d217.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> have you actually tested this on real hardware?

No -- the hardware is twenty years old and I couldn't get a board. I
exercised the path by fault injection: built the function into a KUnit
harness, fed it a status block with those three bits zero, and KASAN
reported the read one entry before seq->edb_arr[] without the guard and
nothing with it. That isn't evidence the sequencer does this, and I'm not
presenting it as such.

> is there any evidence of the sequencer ever setting these three bits
> to a zero value?

I can't show that it does. I looked for something authoritative -- an
AIC-9410 done-list/status-block layout -- and there's no public Adaptec
spec; the sequencer is an opaque request_firmware() blob, and the only
in-tree description of this field is the commented-out size line just
above the decode. What the tree does settle is the decode: the index is
one-based, and the same seq->edb_arr[edb_id + edb_index] access is also
reached from the empty-buffer path (escb_tasklet_complete ->
asd_bytes_dmaed_tasklet), where edb < 0 is rejected before the access --
aic94xx_scb.c:410, the 0xc0 "no buffer" case. The response path reaches
the identical access with no such check. So it really turns on whether
the sequencer can set those bits to zero on a response: if you know it
can't, this is dead code like the second comparison and I'll drop it; if
the field is as unbounded as it looks, this is the guard the driver
already applies to the same array on its other producer.

> Why the second comparison?  As you say the value could only be -1..6
> and ASD_EDBS_PER_SCB is defined to 7.

You're right, it's dead -- (resp_sb->flags & 0x70) >> 4 is 0..7, so
edb_id is -1..6 and -1 is the only out-of-range value. I'll cut it to

	if (edb_id < 0)

here and in the aic94xx_tmf.c copy. (scb.c carries both halves; I can
make them match whichever you prefer.)
