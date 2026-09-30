Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32A4DE707
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777518; cv=none; b=AU8LzAFRu26VRDnzxlgNCUkssaJfg/fDl9PesVpbiWKMkAVAzBwp17EExD67IF48iD+NjMZLjwCs52oSY8uRIQQ49wphSCFAJy0zgAEAFiIX0mwU4TnjSeR5L8FtXnU0nwa5BMtTS91R34vOQTDr6uCkzjsGYQCGLKwyW0TboPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777518; c=relaxed/simple;
	bh=j35vEpIPMoY28tuw8z89btjkr+NCLOZ/6D4QTxytxCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8zoe5s6bK7K5OJRbjf/D5Cu253iGuHsB5Bm+VARNRjyP5A41k4SH14i6X81PzG7VsK/2igDchTWE3vbAifWqpkBl9+tQ9fAZt4cE+qcaFNf3oguzMrdq7o+3oKg51bfv1yFVcy7nCsFYCCLzYilWpTZiHRAFs+0C57p1Ab/5rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcPsC064; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcPsC064"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso2649305b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790777498; x=1791382298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZD5Wk2pVEzvLwEM+dw1Nh8s2zTNtUbkNWimSe6i9Hnc=;
        b=lcPsC064BTceT5wRuKF64Z4IBo4BirDhMITw+WPxU8RRgpTXq4aqbDkrd7qmNq2Rcr
         ezRAICh6//tiKucpKYwid6kRgpgce7656JsKFEfD7pOL4bIMqcJe7F/9Owd/Myd+v9au
         f12Y5IAFWUjk3d7PogxqWxPCgG5Tlj5O9E1wWnjEmN2BIcbAhHM1E5nHiSUY9aG1OhRm
         6dujQ9CIrolq55/FrstNzg4IxIXCwJbiSiG63DEQrTcqvymG3AZj++0pPJJ37s6ub6Ph
         lcW/OO1QMQIKBqG18CNNeulOrsXKb1mpIt5hgg3I3i4IRQ/W1kvMHwO9C1LLQZZa6dHU
         5FTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777498; x=1791382298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZD5Wk2pVEzvLwEM+dw1Nh8s2zTNtUbkNWimSe6i9Hnc=;
        b=u+OmwyAg5MYweSEaErBKypsKelBWQfPnf6BvhHap8WRq5EnEeDilujWIF8I8jn02m/
         xUzoRT5RtbVMiqMwgIV4jZJ1Tt3d3QbqXaG93B3WFK0d92OnPUu9lh5HGVhYHjPB1ciP
         hjRqpEV6OG6SPNx20gFftPMBVxJz6jTLnqbwrKKwfvs9rzRfjlRmY2uM9zbSn8uvl+Xe
         CRt4oU6VnIpg+DpGCyB5FtEeAbgC5mUsCJ9PJqtzSeU8uzX76+fQ73VzFG3uPdb8IS8H
         VqtTPX+UNkH9ITgq8SINLOm/Vs53SLYV8IU4CMXLHtV/tFKnyopGv0DoGWi+vybWRpfq
         Dy0w==
X-Forwarded-Encrypted: i=1; AKwUvBzgOo4R108pq94TiEcuJDnxAvYLEbt3HHzhJWPPVIDdLRx3/mIcJxEsNuFmJ0XgOaV610g+x1TL81fV0Bs=@vger.kernel.org
X-Gm-Message-State: AFuF++nPkjPEUXGu6xchwAejKKIe82DCHyhxcltW/m1SMJ4qgs8GuYD8
	zrzM4MdWhQEpwPztNiv90+YsTnxuUHa9+hBUCq6Rt7728K3uIPjgydOB
X-Gm-Gg: AYBFou1mW088pUXYb/0oluh44si3+F0dBBQG5pVBIKjwpCYiwtnxdmVt+mDYRo+4loP
	PND0tLlyKfeXmEMDx35X4ihiveGqG9PSBj01kKzco4W+YPDKK6pPWHsmXA1hhuN0Pa8vdPESvtE
	cKy4ksyEqCLMjw4k0vkXPGTgxZXaAvkCax6EQy6qx/w1dVoENiRHEUV6NZAQ9dlth/lKRNn+KqC
	nHjmIUQ2Osg3g7rZ52yevp1CJ3JNkZqxVIuEApFYlgmEqpApuHLJk8PW531hjnaOO5eum/DVyJG
	5O4GzeddRxvoNGX3+7scbaCXFNPFKlBXybabFeKti3L+R1dWMkm0IRU1f2NHzYEEjE7LvFLf/4L
	aQpFCQyHv54dBpz3nrBW9kVL52F/LEcN3uJW/HIGNly26PYJyN55jz+TlVPa97HFJOxfC7om8bJ
	pjNsgo0NGxMM6aocdEy6f1ubMxKuDBVjMk1E8/QYgiCCObALIEaoRuQpgPF6Cw+m/ZE3RtSX4V2
	DkuBUn5LD9x6qH8yAPBxSsNzFq0m2Kv3zHa7DwYghUE6JVJoUuzbGoW+7bi7VedDDMSN6uEEg==
X-Received: by 2002:a05:6a00:1d93:b0:87c:9094:b72d with SMTP id d2e1a72fcca58-8874980140dmr1107172b3a.6.1790777497986;
        Wed, 30 Sep 2026 07:11:37 -0700 (PDT)
Received: from lima-arm64-dev.hitronhub.home (180-176-144-38.dynamic.kbronet.com.tw. [180.176.144.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88726c0c243sm916905b3a.58.2026.09.30.07.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:11:37 -0700 (PDT)
From: Harry Hsu <x90613@gmail.com>
To: mbenes@suse.cz,
	pmladek@suse.com
Cc: jikos@kernel.org,
	joe.lawrence@redhat.com,
	jpoimboe@kernel.org,
	linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	shuah@kernel.org,
	song@kernel.org,
	x90613@gmail.com
Subject: Re: [PATCH v4 1/3] livepatch: Fail object initialization on duplicate patched function
Date: Wed, 30 Sep 2026 22:11:32 +0800
Message-ID: <20260930141132.373715-1-x90613@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <alpine.LSU.2.21.2609181452160.21788@pobox.suse.cz>
References: <alpine.LSU.2.21.2609181452160.21788@pobox.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for catching this.

I've updated the duplicate-address check in klp_init_object_loaded() to
only reject the pair when both klp_funcs are nops:

    if (prev_func->old_func == func->old_func) {
            if (prev_func->nop && func->nop)
                    continue;
            pr_err(...);
            return -EINVAL;
    }

nops added by klp_add_nops() for two replaced aliases are
interchangeable. Both just fall through to the original function, so
allowing that combination fixes exactly the scenario you described: an
atomic replace patch that inherits nops for __do_sys_fork and
__x64_sys_fork from two separate previous patches will now load fine.

The check still rejects two non-nop funcs that resolve to the same
address, since that's still genuinely ambiguous. It also still rejects
a non-nop func colliding with an auto-generated nop for its alias.
klp_add_nops() always appends nops after the explicitly-listed funcs,
and klp_patch_func() always pushes new entries onto the head of
ops->func_stack, so allowing that combination would let the nop
silently land on top and disable the real replacement instead of
failing loudly.

Petr, do you have any further changes on your side for this series?
And once this fix gets an Ack, would you like me to send v5, or would
it be more convenient for you to fold my commit in and send it
together with yours? Happy to go either way, just let me know what
works best for you.

Harry
