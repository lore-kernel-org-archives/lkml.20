Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520512C2360
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580350; cv=none; b=Dpux5onec02BiR4FwQYU9rmS4x3dfSlTh3/oyuuHNcZHVFZbqoUB5F7LeHVcjqPZre50S6FXcY6r7R02f1PVzHux/Vi4Xe6LYz7YJDnrTf39eKd1yddX63rPuh3sGvxpfy0bzUHR9Up01m7dJvCZFDevw0N7CqG0hAL1XWXCdgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580350; c=relaxed/simple;
	bh=q08SMMXYiHrB/t+BG5Y3bR6naNmrNNO29kDK3fVq4k4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oWk+XNIaRQyRtZLkjJ/9lTwuECUNHDnCRR0l6rah8SYxhwMdOi2eIbVKD3MCEwrRSyXeYTfsSfO3sE9/LjmhS2hiUSS/xlIRW4pel7IK3hl76mk5NqLkL5yQ1r6FTiKCRZlB9TENSWD/p6ugSoaZ3iyVCQ2b8c81mbY8r24x6NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxXUNGf3; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxXUNGf3"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so2468523eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790580348; x=1791185148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ROGDvtvh53/QQPkABiv5e4DoVYicohxxFWZJETjDQU=;
        b=mxXUNGf3q1qj3KXBeHHYrUEtIYoOOVdlS+fsvzI1n7wpUw2qRSb/N2njJEWmcZIbaK
         cMA7Hw8qMPFJjCKjacumBU5NvQSrdNvLF810Z2nOzw3ujVr47G5t4g+yMlvvz9WShOT4
         sE2mTWGIp8z2vvaxuzXwwj3RwDxCkbVH+ZGvCCRAANs2bFuCOBP0rC82Are5OimLsd7s
         t6kAnzpJZNX15TyOhqGGmfUMRcamkOwG1dxOCXjDka0ymwGFvDYNVvPAd1MYkRcfoCB6
         24UdTctkqKP9h1hZmmsB15X5UZQ47k2fo26JxxZZYAP+0SiZpE4r8X3o0JypwLzeBzk5
         CVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790580348; x=1791185148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ROGDvtvh53/QQPkABiv5e4DoVYicohxxFWZJETjDQU=;
        b=eTtZIxf4OuUig9lJ72kL2Rv2f8icDbQz5YCWngVkvvv+ZnzykJ1cFlwbAiNk92EB1q
         Loygkvn9CXKmJduExQRkC43COJWEcKbJw144p1WnsCTBhttAoI02ShdeJV8wxezpPGGm
         kWAE4gLOsAFU/n07emtKQ81YXa1boxFcFit2URCEtFSQgniI3vh4//KXMPQS+jSwy89n
         JV8IRpLKBWj0J0aUBuV4ObaSP5Ilx1a8iAxvQEZW4XaCV6A82wuBL7bNbI3V4UjipYhG
         QdwbBy8N0xigJd9nFLe2soU6S7CIhN6M5AqfyBwliAxfhLxAn+X5aWRZke8OyysOeu8M
         fdYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaGe8lbIUFXApIM4oHy+JiL0qJzbviz+uVgM8Xy/mdCPfO4aEVjHEYp+zUKXbBg6xhMia8tggJknsumDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr7TRwjQbzuTIs4LWJVhnmUtNnkhsOJAC4jgE7TZN5y41GVrbq
	WfoHvCq6Kx4kbDnnawxF+d5PBtNKIa5b0Et8tuQn53lA5tR5lYOc+lgz
X-Gm-Gg: AYBFou1HNG9T6AoboeodFZhvjGnSKRAg/6kraZEMgLs/wzJrAF6hwz4WdsaKc57M0BH
	xuu2u6lSke8bE3Wy1b551Z+kwCELwJV2RS5KXxHKWzyCvqau5xFD6V7nPAdzU+3YW2orKAX52ja
	GCSW5GqxtUx0LemUoHOGkjJEIIz0AV94I1zZmT+2TduXpBvvMLkTEIn6GLIPShMgHFZEGE59ZVn
	V7RJUioM5YDZolpNOt6PnwUtGBEZX9cC63wwYaWidbSkfuXs/aJSniNGCds17VHcYyE92iFsTtM
	AuER/pzuZjyHxcCasQuI1TSf209BKmzf4lE+OTVbpYbFi0izkqOhp+FHVyBOEpDVB8K8C4XOTgf
	XOOdkA+a+iQVkoYX7D6dpKxfQX7tPVLZi/i3hkAmUsgqYoURUZl2sPOLcNrEt9XlHa8JcPzMouC
	UZflZnwhN332mV+wySggcx8DT4S6ATmyQep9NQdOoumMRhs7uffP/9TtaegCSgGAuMtp6YpRRVp
	LqT21WcC6KqIw==
X-Received: by 2002:a05:7301:78c6:b0:33b:edf8:1919 with SMTP id 5a478bee46e88-342707b407dmr9263412eec.13.1790580348291;
        Mon, 28 Sep 2026 00:25:48 -0700 (PDT)
Received: from wujing.localdomain ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145d0fc9fsm27735529eec.25.2026.09.28.00.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:25:47 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Qiliang Yuan <odys.yuan@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	linux-hyperv@vger.kernel.org
Subject: Re: [PATCH] KVM: x86: Clear CR3[63:32] on SMM entry from long mode
Date: Mon, 28 Sep 2026 15:25:34 +0800
Message-ID: <20260928072534.1987-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928-kvm-smm-cr3-upper-bits-v1-1-138f52dd531e@gmail.com>
References: <20260928-kvm-smm-cr3-upper-bits-v1-1-138f52dd531e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

+Cc Hyper-V folks and linux-hyperv, since the failure is triggered by
Hyper-V's handling of VMRUN for a nested (L1) hypervisor, i.e. KVM
running on WSL2.

For the Hyper-V side: the VMRUN is rejected when the guest state has
CR0.PG=0, EFER.LMA=0 and CR3[63:32] != 0, a combination that bare-metal
SVM does not reject.  Is that check intentional?  If it is not, a
Hyper-V fix would help older KVM versions as well; either way the patch
avoids creating that state in the first place.

The full patch is here:
https://lore.kernel.org/r/20260928-kvm-smm-cr3-upper-bits-v1-1-138f52dd531e@gmail.com

Thanks,
Qiliang
