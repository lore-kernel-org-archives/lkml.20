Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024676;
	b=d+vswQHcj6o0OXSnfExa161EdLTO4asalq775s6AlASY+fOUxFyt4UvmpGZ6/wSrCDzO
	 qqEol7UNsRwyvFeZpMWN7cZjSbqZ26AytR/iXMKoRPNzp2SXpz6djWMUtB0/46r1aiXhZ
	 LOmy1rQtSOJQQmyk/0tsdrYFeCjqS3GWr1bKhnrvguyAEaM/38dIikIzvQv+0cWH+FGDh
	 O79o/nt7jGdyQWrBBsEp5GcgxBlu6+VN7dLriTOIOX1gLOZn7c12/PIJiY0R1zSKADdV0
	 BcocM+EJSEfFDoRal//bcfVoVGYX+ivMXJpaLcs4bW2xtnFvHsrZI/Z5AODh3MoQVgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:
	 In-Reply-To:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=XGMGQV/R32o4fBLzlpC7+DMYEQzLmxFjxpt9zeX/VRs=;
	b=j85ryJsY1gywn5SmiD11AU/5hTkNma/rz2k0NA/5av1VvkpH6+r0FLnPnchGSa4RtQCp
	 sw5Aw970FcHu5WKaAtN954S66B9BLIK8eFV2zXlKMnGW830CN6pgK/+8KW8bV36oVGHfP
	 zsPkFsQGsPzcjukAnvGVYsjupgd5h0k2OY6p6NhdTrdHgkbGy4NFR9rwZ1etdFOehnCPO
	 A9sUtZlsH+56cum+nkYoUBCWKi4H10rnSP430sfazy7VoyO+Koo34sO+jVtrEh8cT6inW
	 brd21PAf4B4BHzBXJBngvw6kT+ZZ8MCpakxkdHJkWsN4O7qDJXaogEdbiYXXehXCqzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=G6SKTq7k;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703AC606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 703AC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=G6SKTq7k
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06da65d92so1797203b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793024676; x=1793629476; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XGMGQV/R32o4fBLzlpC7+DMYEQzLmxFjxpt9zeX/VRs=;
        b=G6SKTq7kbP+DcSK9Tdvnm69bmcExOkVrvq02hz3K/YXRMLS8qrTmo1oB6PWT4gNuBi
         ai5z8iRcUsXtATGLWvxO9obXbv843hjoW8P53cQYHQNw7aaTCvcCVyHpNCReRkXwvOOG
         LFRLh5XLdKkoR/lzjtpTsk2cVYuOmjjdJz8HNPZ/w7Y0cmCVE77Lx/XDpfMcZwN6FYSK
         vO/9WcnDcVxtgP2yX7hrEk6x4NCjMw2NR5ZlqrUrSg/TNTd5r0HAqaqbOTYreKGQjS0O
         GYd/X5OJrTRMM08Wu2r31n6hCh+NOxJ1E2/M3Q4FnkgbUaVuuy3OBuql7B/bN5eGW13o
         vnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024676; x=1793629476;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGMGQV/R32o4fBLzlpC7+DMYEQzLmxFjxpt9zeX/VRs=;
        b=fn52htu1WYmMYij+a7Q3GB1QtoJQeM81vx0F/vQezatLHWl36rHAJ6A6J0dX8Etido
         sqrPOECCfNYtkFdfzXp0xlMdXUFpnExbRXg3ru+V5cQ8JEsutCqgOxctCEgfX4OkiwnF
         jjjF605TsFszO2OjAbju++F+hUs1FjU+KdTW8UVLAonB+vwlSegO+W134EBkx6cyvu/U
         k5kJUlLDOe+xRGeLZEaMZm7CvL5yk47yF0B1+4zlUUn7hNZocGCuBDpioVaWptmyxhAm
         pgK+LvdWZHJ3ERkXXj0mIY1UO6z+5JktiikN/YAMfImaGdrmSuJLH33iPWOVejiUUCRx
         K9MQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTu6MNf/KTjvS/GECa7AqX2d5v6JIGf4XHv+Vy0jXJIfuUMbCVJ9BSfOEUrX62wMzfkIRseaYVT2Pidv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqzAEv1BHIRRItIuN/ZnbTN5KA1gXu3MkuomEejyDSfJBs9tnx
	JJui9DKuQOYajb9yjJ01e4p4htWh3wKB2T+LE8vkuMA+DZ1Xr/yVdxsYfFUAZ4snViYwMtAxAn3
	NYdgY7gSTLcDgle84mAC0ZQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from pfbea28.prod.google.com ([2002:a05:6a00:4c1c:b0:8a0:9000:c7a4])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:88c4:0:b0:882:6836:25f0 with SMTP id d2e1a72fcca58-8a3692619f9mr5548863b3a.52.1793024675396;
 Mon, 26 Oct 2026 07:24:35 -0700 (PDT)
In-Reply-To: <202610261647385343iIt_Rpe2JeqxY7SCEeUl@zte.com.cn>
References: <202610261647385343iIt_Rpe2JeqxY7SCEeUl@zte.com.cn>
Message-ID: <18e21a713eb04af4.3137322e31362e3131332e313435.1a6419.0000sendgmr@google.com>
Date: Mon, 26 Oct 2026 14:24:35 +0000
Subject: Re: [PATCH] scsi: ufs: core: fix NULL deref in remaining
 scsi_cmd_priv() callers
From: Stanley Jhu <stanleyjhu@google.com>
To: Shao Mingyin <shao.mingyin@zte.com.cn>
Cc: "Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, alim.akhtar@samsung.com, 
	bvanassche@acm.org, peter.wang@mediatek.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

On Mon, Oct 26, 2026 at 04:47:38PM +0800, shao.mingyin@zte.com.cn wrote:
> - ufshcd_compl_one_cqe(): scsi_cmd_priv(cmd) runs before the !cmd check.
> - ufshcd_mcq_sq_cleanup(): scsi_cmd_priv(cmd) and scsi_cmd_to_rq(cmd)
>    run before the !cmd check.
> - ufshcd_issue_devman_upiu_cmd(): scsi_cmd_priv(cmd) runs before the
>    WARN_ON_ONCE(!cmd) check.

ufshcd_exec_dev_cmd() has the same pattern: scsi_cmd_priv(cmd) runs
before WARN_ON_ONCE(!cmd). Could you cover it in this patch too?
