Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285C62E7370
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788142782; cv=none; b=IV2GhOPkYgXd3hrE482SIl8g6aueDRCrgEH6ZHWzsCL93W8t2m/O6Eu6L4IMzm/cA6X/3rHuvxE/0gL1RMQeVpmvcHfqzEk8ny+FCx3I1TPnTXR1MFACjkepGVY230nix57CSYcM6kf1bf32BVNMS481miXHp/InqXCYIzlxxMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788142782; c=relaxed/simple;
	bh=PKmDdjoSExMTA2FB/aqE86Yhv4zjpHd1fB/tpmI84qA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rboSCyk0zvxbfOMDZMCoo9yi4cKysZUjWk/dO1zQTQhI8nqRuGeuoJ6TU2WoFKQ+/vWCW30k5QmagpMNprwdYKcsCTf0g5Qoyu3HSgpNweaQ1ZGlOG7EDcJSIG+cGYyI1F/sYFBHc3AYoGknOiuLtcmuQ+W0FrjNAMhiMr02G6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPlKjySe; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPlKjySe"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84eb992a881so2572548b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788142780; x=1788747580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKmDdjoSExMTA2FB/aqE86Yhv4zjpHd1fB/tpmI84qA=;
        b=YPlKjySenmiqHGA6mCHWN7bNtkY0S5XJtfroui13n/a/9rmxM+mGwo6EmveF7OE3Pu
         CJGr0NNe/EaMmm/yIlVt4mL7saAre4xvTBVhRq1LXyZ7UZrsy7vgk1NPaXHyMHdiy1iK
         Y94zTawtih2RZSMtlEri2ts/qV88dNtXSWnOPcmImAq8JlsAzNsIBIHgo69tbZzC2+88
         VXjH0Wb1cFloWges32k23ZThNO3IWj32E2gnAkP59CeokAxp2PhdirH1vUneWS4Mutcb
         QDb39STkpzdqXvb0RLpgnX3idKUjsORVPVlhfF8eJ5bGXAYKEaLaHJUrTdjyftHFTStM
         M+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788142780; x=1788747580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKmDdjoSExMTA2FB/aqE86Yhv4zjpHd1fB/tpmI84qA=;
        b=hOB4OZb9JPzje/528DcNVJMYNjsVjoudUKdAXW4s/1yqa0Qgo/Pk0V7T++lZ5cNz5L
         KDmFmcObOztpS3B++ABcnesLiC4HWjgLfO6h9yQqvZhBmBiEAbb4/HSZeeNGgWx6AJx4
         FWWKSrpB87bowJrYmYSK3Xd8OpUzlJj7jROUFJfHCv2GBsS/sFGEr4Jgls6FgQzKNkQ+
         byGqvZThwjt/O90+I3IbPn65AQFjLiduMQP93G8QUFgqpkrZQHRALNjdkB7Ofnw+6C3o
         RVWYogwxd6yiCFKF0lZ8iLCB/gvPDjKLcktb+17wU5KQG5KTTjkCfEv+te2Av/JbgsQI
         DAQw==
X-Forwarded-Encrypted: i=1; AHgh+RrFgrVcE/6uIuqgCef/NTXEenQiPJZa9x6kg2mgz/r2BTDIw5Z7mi+ui2hR6mOqyPkS6vMuUogU4WtflkA=@vger.kernel.org
X-Gm-Message-State: AFuF++mVmvjxUJP5seycUqN3b4lEbtUN1Zb4xOvg8P2AbBXL0zwPwPzA
	iRiRs+8eYgBpni+S7KhCno90JPROrT2n3KyA1tCr3g4iyDqOHQsQKo2c
X-Gm-Gg: AR+sD12GVhefO32xkPBKrqt7Z0wreQkfX/yUAkZoJIVXcgrItSAjUJXCAZthiO1paot
	gUB+aVpduhi3P5pQBCBQqnpfkoejsz99PHVIJ8FdECGdwLHfFfxISa8SmmBhtB8XIspQJIWDlmS
	0cOfkqc1fDcbUALfF4kGJ9khF4cZxuJ/Jjx8VtsCcaUATNg8PMyL7IstIJTnD8ifL2kavbsKwp1
	+tgCepfy2+n0Rxj0Sjbmwy9f0EsDHG2XzCHLyOQxhEmLNs5XIpVY0odo6LRKMZ7x1zVt1FHT7fH
	QHpMMvEmyopGDBnc6k53Vswmv5hL2jlCB14BVKq9Lf2CEocYpG1EaohcvfNwiybLkiYGiXRK2Ex
	vPsZxypmGquns0S468shCArNvzmioj7BNcKzQgDjIknA0tuZ/1ccTq/sdkYcbScEddlNRjTQta3
	CBq7VEXgsWSPsB2usRgQGYkYo5alehB+JXj2EagMk5u+MP7m7o3ZvI1uzsXkIR3HGwz/lxCLYrf
	NYGCl4IXVmV+lHTf2iRx7VavfR/0kHULNxV5RHWw4nm7qaG826E0w==
X-Received: by 2002:a05:6a00:ab0a:b0:84e:4d6:78fe with SMTP id d2e1a72fcca58-8562972fe25mr38688046b3a.3.1788142780409;
        Sun, 30 Aug 2026 19:19:40 -0700 (PDT)
Received: from secrnd-cstp.tailb7f510.ts.net ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fa7d8desm2941001b3a.13.2026.08.30.19.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:19:39 -0700 (PDT)
From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
To: Leon Hwang <leon.hwang@linux.dev>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Sanghyun Park <sanghyun.park.cnu@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Pu Lehui <pulehui@huawei.com>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v3] bpf: Fix stack out-of-bounds write in cgroup link update
Date: Mon, 31 Aug 2026 11:19:09 +0900
Message-ID: <20260831021910.1835461-2-sanghyun.park.cnu@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <22d83e2e-e732-4549-9bfa-fee38f7c6143@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you Andrii and Leon for the reviews.

Let me introduce v4 addressing the comments soon.
