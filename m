Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFBE51EDFE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694997; cv=none; b=FG66KTPXlFkSl96/yhCU3kzkjpuwSdnHs6mqIvJExoFif/iTaUxE5wVWXtGbe6/NgwW4M8dpFbovOlVu3EeMofK43WWhR5OBUmyg8cNB4/3kcyRl5catQLMLqFyPZ8ITljS/zgMqFbJu71mNK4D/dXOKga1R++cJWllKs6sYOh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694997; c=relaxed/simple;
	bh=bWF2RLkDSukvRv3ojzJFf0HCx2pYwdCFf9sW3v74D0A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FcUG+q3S2Q/2hEd8uo49/dX/nfci8UfjsLIu44BArn1NumqXVU811XtgvwX7eFWkhCPMRwBdLAIKN2VNP7XrWUkT1GFadRsvFNvbEHRykD0LBPHq0Atw+34A8BQkGPwFheqeJZCk4YmDM7Ez7Q3pbOYAw4VEmfxqJP58acrHGtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TX4lQJiv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=t1IVhKGo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TX4lQJiv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="t1IVhKGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790694976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=haHxVk6HtMmMg8MDyLTddniohI+cOYlGgDr4EoKwINs=;
	b=TX4lQJivVRePQyvZo1VZrmOLSuB4aQPuXmMveI2Bg7i8ytvTCu312kVGBrchHM9UMpxmKl
	AuturOCSB+ca5RYdyXlIp+WLB0yetfVmadLb4dnyXOYy1DRs8NdAjQ9O5NgMmnjXcN3yTN
	fdfVkrr000Qj7FxoCYWvdpiFP5g46k0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-oz6BmVSOPTK953TH68VoCQ-1; Tue, 29 Sep 2026 11:16:13 -0400
X-MC-Unique: oz6BmVSOPTK953TH68VoCQ-1
X-Mimecast-MFC-AGG-ID: oz6BmVSOPTK953TH68VoCQ_1790694973
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c5e9c2ec1so185855285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790694973; x=1791299773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haHxVk6HtMmMg8MDyLTddniohI+cOYlGgDr4EoKwINs=;
        b=t1IVhKGoFPqf09lPU8gqwRcCxXQZBkx5NC4TR2+/E1fefLE6YJdqOJUiNfuJ5y3kbz
         Oeord3cjw9cKE5b2WWYeMCeOVtTYPH8GVNL++CgtdO97JdiKx3JZPuq18/NENjwNGt71
         5qEryrEZfBsN3/JTNwkl+JcedGdzoarYM365yRo9ElZqPLvoy0M1epz6QuEdnbc3hRYH
         24JNJ5fWSENmLnDx2ymFdmfCMWK5d+ylANvYMG7QshVuW9+V/7G3wa3StDfTh2BrvwZy
         8AUWwnvx28RQqMxwvDgoW5JezfQTyONhu3BhpJPEiFHSr+lHT+J+aNZF2mL7i56TlguX
         pXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694973; x=1791299773;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haHxVk6HtMmMg8MDyLTddniohI+cOYlGgDr4EoKwINs=;
        b=YLNkdv3Pp7IG1Uoct+I7/h3DmdQcIz4x+CTlhI42PCtfjapsMFTejxsyI1Bsf0DQvt
         bC8oApiJGs0VDrP7AldANWkDvZzPy6dHsCUSsIEi7206tl/C1hW2QB3V45R6/tdziMDc
         c5/VDbpl6U9sE6NRStreUb6xnIZPBnSrGt+nxFowYHbs0iuBqAyi4lrd1Pbewttol0YJ
         CcarIub+1lpwxFvHYh+jjQMK6Sk3VRSziT+y9nltsTpt8vrNUrYhtyg2HyMuUBs2OrDQ
         ow7b3QSmiv1Y8hUuZZMHsl3N1I/YONU664cfT6CMRntkf0Gvmyk+vnwMmO7IxEptK3ME
         Ad7g==
X-Forwarded-Encrypted: i=1; AKwUvByYMgoVMFI2yl/9lz7WyShvyeA1Crvfk311Hg9ZltuSLlNteBWWMx3Dd0n7h35nSDKrH+dsSZRRoiwMd60=@vger.kernel.org
X-Gm-Message-State: AFuF++ngIZhZeI1ONYefFu7tPHN69RNuwjpqeCrgyRab/pPQBuFV20NE
	cTgEKisZF6Dq9Gi//9Jrg+5Pm9hmtQ6Qsxyw3Uh5Liisr7uQTj6mXYSL6mIVQFig9cmrM1jvi1C
	2rdRaCtf5hmnt5EkRL3ZSi32H95dbAQkDPm//YtmrbbZatoXv9826krZ60nuwDBKokQ==
X-Gm-Gg: AYBFou1S17bMH6dAfE1vbZIjbw/c3TBD8lfdUpzaNyz3YN3XIgXpHU30ar2Wh4/nMua
	G9pJSLe93TQrqGawK3w+C/sFfBTeI1pyT7Jwd7IM9fagT2svinQw/a9scLuXIk8oBNUqz+/OBYu
	JSVP7fTzLTKw3gsg/0UqF5T3oBMzonVzjDWwdezgf0lPutBtkRXd7qq7JLLuLFIK14hBjYo48Oh
	7F7/p/w4GNUAmfJG/YoPj7smo3NHa3vHVOJnZxTYxYvvKn23x9A/EsAJU8FxNCaJO1HrjcmJsN4
	FiYA0FtU8uwbe1fd/nT4jFYd9MtwV9KSknOIn1936Rto+C3mdc79ie8puXHKlbVbrHhC/B4LdtR
	EEK4sDPbLw7JqNtB/+4lfoAMMRxdYZhf8rWuzG0zcarQrgXkzwhI=
X-Received: by 2002:a05:620a:4722:b0:93c:5b32:c9d9 with SMTP id af79cd13be357-93c8bcd086dmr532936985a.6.1790694972728;
        Tue, 29 Sep 2026 08:16:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4722:b0:93c:5b32:c9d9 with SMTP id af79cd13be357-93c8bcd086dmr532929185a.6.1790694972197;
        Tue, 29 Sep 2026 08:16:12 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c81598783sm411763785a.46.2026.09.29.08.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:16:10 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yury Norov <ynorov@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>
In-Reply-To: <20260925193858.250215-1-ynorov@nvidia.com>
References: <20260925193858.250215-1-ynorov@nvidia.com>
Subject: Re: [PATCH] clk: si521xx: simplify si521xx_diff_idx_to_reg_bit()
Message-Id: <179069493301.199845.17240762807739332840.b4-ty@b4>
Date: Tue, 29 Sep 2026 11:15:33 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=306; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=mZR9PHzdXdFqvDzHRwBoXIJQhHINnxzMIo6bw+8Twnw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2XzNaqmWlqvTFQsrRXjf7rzivh0z3RbaqotPnHUVn/
 54d33S3o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgImE7GJk6P4llzBrV8++Nzc1
 Q5k0mQslWCQc1/oX/vjZIPX5+4mrRxn+Fx0wan78vuHLkZuzClREWF+kdy7SvCsaE8S8QHKHbts
 kbgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 25 Sep 2026 15:38:58 -0400, Yury Norov wrote:
> clk: si521xx: simplify si521xx_diff_idx_to_reg_bit()

Applied, thanks!

[1/1] clk: si521xx: simplify si521xx_diff_idx_to_reg_bit()
      commit: f619355a6bc6e2ce8b2b104abfd4f2c86e22aad3

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

