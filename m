Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777263;
	b=ReEeeYQJCQoMIIJkqNZFld8D7w5201N02U88JZ2qlVZg9SBLlI0/iV96meIScmMsXSFV
	 cMlMhuxDWIzteEOCH8y3ls2FWNC/ccCVCYN6GHuy1tw+29mi9tMxq3M5fkrA2SA8TLYvz
	 mAJzzdfP1lVAbMqozcEfzR/fxUI/fjwyDlbnrHRf9fMRVH8PbMKUAqVPP1f+BCDCse1yD
	 rdWMqfD0rin975yx/maP3k3s4uCn+7crvCSJigZKAW+GwhyDQt2/iuEU/mq4nHo6EMRpd
	 oPAcowS/8/yiTB/6EIzaYr1N10GEK08P/arrmqR+X4bYoeczfni4Yy/gYvzz1UUDYYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2eIrsdGclmsUkVstChbgZeSp9y9jcEYAK+IEJRWBFtw=;
	b=Dk5ghWOAsC+iWdVH7LxNpvesCj22jYBB1nQUKk53H2POAVqJVMJ+g+7CTVRY6v7LenNS
	 fgHgR1V+Lm0ir7+RLCBIr7Djk0u0iCfZLK8RA6cw12skHuADP4rFmVySoGdz6Tt/Bgmy+
	 9wxdQURmScRENIYV5TU58Dft5a2wcStxe+v58yjFmkAMlrZTfzkOmHraAHHRqtELX53uu
	 vGk2b5c1JDICozBQi5wmVXGnAvem9wqoaCqcA5/WydSPoznOudu5DvxMp6ZAFPzkt7C2T
	 IQKhtcU2hiU1IKCp2d6YHel/CMkGXGDzFHbElvMCp8AAxeJZdbiz3QUnTIetR3NDbhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URaBGwXG;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F1B606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F1B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URaBGwXG
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e5fb79ce82so1864535ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793777262; x=1794382062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eIrsdGclmsUkVstChbgZeSp9y9jcEYAK+IEJRWBFtw=;
        b=URaBGwXGMK1WwGPhLq8jIwi21Gh294q3SvRM0Jm2or+AOHs/ep0LgltlMwQ26D+NEp
         qi4tVEY5bP1wNnHzx6dqGplAIS3YpDlbzr319bHbfsv2q0+eUWpB2l6WQwOENyMBrRIH
         TKOi31tIVcsnxIdQJw4XS7eJ5CnD9f7snxjuYn6wWFl0TMtxSiXckqzf7Td8T6q/6bJ3
         y7/jZsqMXixZzVO3ta8BjYZNIlm4jGE09DGpmJKXQqr6PgOCZPpygX/ZJgNDzJXAMYew
         NcqLnntsMHBArEq2lA8jWCak/Cs/Gn1ZrXpT/tOMapJnmC2G+GTXvF/lFzWTCydJD/1g
         N10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777262; x=1794382062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2eIrsdGclmsUkVstChbgZeSp9y9jcEYAK+IEJRWBFtw=;
        b=I4OmqMKyh2M6Jt96X7e0O78ntSmr/YqwKVAeqF9mnIHwPRDKcmBxrcvIIeGBieOP4y
         JeowbkpmS3VEVdmbFEocj31I0pfa/ic2iE5sNNSCbu7nidXvibdQL0dXmY1burj+hlTs
         Uo2O9mxZm7vqnSvny9mwRMhhqmLpsDwhIocXXhPpxRerXFCyEeFjJLIEhGY1HegoqZ2l
         OIuXttgXQ8qUnKQMXzwXaAd/a1xl3ms43j5sw03s5P33YLafUUFLcTCMxrARuqfChlEi
         +0p9csxgfQ9+Mrt0ZK/1hKPjITcvYOxfvQs+3YpzK+TuvdfGLMMq5YMS70e26GoAtstk
         /0Yw==
X-Forwarded-Encrypted: i=1; AKwUvBzGK17MGJuOu0lNx4Z5IoYNbgacQYzaYXs/BK5WfbtibqXsiXWEiRYcxfxYyAn9faIEbY0hKmE6+Vg6ACw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZDoSjfB+jIicCxF/XSJJRO08KiA67VQhhCJIQp/bkO1sv+n6Z
	P/7insGnBeFNrc3hPIkiaQU7DWIVyd+zwHUm/E6tx4oFPfsKUhZOyhY=
X-Gm-Gg: AYBFou2NHnpc9VR/QIGnp0x/9H0xXdcasy8kCFVZZzpePNCKaWLT4OELbSetCbwFbUH
	LgOh5wjkE5SjCN0+gvNjOQPxR2OsQPWq2S78LsrQYpUG1DRDUSXRMHpIqAZen1q8pkakvzr/cYF
	uL1hyvlEHQ1fZE7P/UNsMQ2a8HQ/YEJRB5Y+QX4xzFajTwl/OKaEf2gZtdvSjao9ajiGTrLGxAc
	9JEOikKrBagOFJkAO4SFTjhqUOW2WAlRmJOFoFZgeSILvrpiMuK+nIAE0W7laBakA0N/58csylm
	rx9YHsao4jQUJdB9cIHyNXxRygJ0VxIXqQf82hoN2QyD81hCA+nkKjn6xw4oct+tLarP7RNmu2a
	3uFLmzCMqhLn8JA1rUfJ4djT9ZrkiZYFVTZSi9Ta0F4wJg50zeobQJ79aVYhBBLqlsAeRyRfcuJ
	qtBl4kHxDQVe43wkoxgN2a/Ml0rGxkOW1RQ9VwEF02HY60bdM7j+dE7OLP8kO5di8LSqqgx06e5
	8/08K0rHo7lvicLbDVrfnAMdqZyllFJkPQmMnrZMb/8PItqzuedEwIT6PsaCgnfpsyDKR6riXM9
	7Rszmkeq7PfQpmB+6wOSvgm7rTqxteczucSpHzhEsIm1rkRmFS70wbN4NeH0CJzK4ryq2VOZeDa
	Ywv8KkrdzBUgnrw==
X-Received: by 2002:a17:90b:3951:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3ae89798089mr12661430a91.47.1793777261725;
        Tue, 03 Nov 2026 23:27:41 -0800 (PST)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e087csm8019210a91.4.2026.11.03.23.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:27:41 -0800 (PST)
From: Burke Cates <burke.cates@gmail.com>
To: ccortner@gmail.com
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: edp: update v8 power-on programming sequence
Date: Tue,  3 Nov 2026 23:27:37 -0800
Message-ID: <20261104072737.3489383-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179346367993.44447.8683103034067826560.x2e-share-edp@gmail.com>
References: <20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com> <20260622-glymur-edp-phy-v1-2-814b45089ac9@oss.qualcomm.com> <fc3d0dfc-20cb-4289-a0dd-67ace50d42d8@oss.qualcomm.com> <179346367993.44447.8683103034067826560.x2e-share-edp@gmail.com>
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

On Sat, Oct 31, 2026 at 11:24:31AM -0500, Christian Cortner wrote:
> Writing the firmware values at the end of power-on, all 120 enables
> over two boots trained 4 lanes cleanly, and 10 of 10 resumes. Which
> register matters is not known. Happy to test a revision.

Same result on another Zenbook A16 (eDP at HBR2 x4): v7.4-rc1 with
Bjorn's v1 as posted (ldo_config 0xd0, not 0x91), out-of-tree Glymur
board patches, and your five values written after DCC. Link enables
with at least one failed training attempt, over fbdev blank/unblank
cycles and boots:

  without the values: 30 of 400 enables, 8 of 61 boots
  with the values:     0 of 500 enables, 0 of 162 boots

One dpu_encoder_virt_atomic_disable() "enc42 timeout pending" at a
blank (1 in 500) appeared only with the values; cause unknown.

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
