Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544408;
	b=3pRAY60v2xjhpaNhsolesFcTdEvMZoZBvZMGbbxICUZ0CxCe6+WriPhHaz72r/BKrpu0
	 2K+Myc5P481TJelOt9cb05MGhec38LtFKM0lyB7HLptqov6g7LJ9ZaRGMvE9PW7oNKqcs
	 qCfIxcElSOboWz93Ye4+YErRh2ONwA5/Didn65ivqRqYvnr49XUerfAo9uAyyttvkowu9
	 8xxU0Mdo1boytm8EZZLfHehVGbcA7V1zUMozBNT6iikNRAU5uxh42v8fCSSQBKoqUD2N0
	 WxutlQ9kXh5lNehezIc5HhbGQbNBJf44zZ1SHlkQm4TZWPV0nwoH29NRrUGO7K2OEhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wi5Uu//3wa8/Ft7s/aMc5zpRyu0NlDyq71TEbyp4LVU=;
	b=bxJYHmOwDRER0hdV5PZrzH1bJ5EN4Ow4H7bOJCc+fhN2Gk2s2Z0HdypQiTe8Arr9/HKF
	 QU2lU1dwHnjpjPPPJ042I2sb38q1dYq1Ghv5hc/tL7jqrGTULLE+Z/0qmPdU5tIvS3whi
	 AQi78bm3g2mIXQqd7zwkzS953pQUxt8TpMNJ7y/y27fx7LYdExNlTc9wgC5Ac2kOJR2S9
	 gvVCdn43uJMnZUgD/TRM6gH+yX5ylyJebAHXeVspKY5G8Y3/liUU3vfEq996ZpLPA6Dy7
	 gXDfC3g5TrwbTC+0d7ao7TVvM+kdlDjNwAdkaQ0D/rZsyt/qNg5ZLeHh9fJa6GMEIdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeiaaBe1;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52075606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52075606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeiaaBe1
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a315ed211so2690619eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793544407; x=1794149207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wi5Uu//3wa8/Ft7s/aMc5zpRyu0NlDyq71TEbyp4LVU=;
        b=ZeiaaBe1IVMNoudVGvUleL93XFdETCYM104SUBSv+F4HltfVEUzJAjSlK0rRa0Hnd9
         bP+LCvOVh1K8FhEVQdEyCPM9rXZ9ZqZdY6z7QsnTzdGysrxQkNOT+d9cmrW+KVpEaXgj
         qFK7KD506BYtg9a2XFkfhj+xVJ3aLwgrRxhT0iF7A8/DjTCC7yK9MatlxSyV95otVUBC
         PoHqGrQ3OvvL2KySxLQIKvOc4fJMqVQvvNatUg5Tgkm4bQj4LFUdVhWkPPDglI1SkBbw
         PZZfAlt3qX7psTKth3WZSYS3v8vq3AH8bkvozeWefsmjtpI89lNoB1i7FnjvtMVKmnam
         TjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793544407; x=1794149207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wi5Uu//3wa8/Ft7s/aMc5zpRyu0NlDyq71TEbyp4LVU=;
        b=u3czmNF92jFcpIJiWrP3RYsOlnDGFDVWHSqzp9rChUihhytWeEKXlK9Llu9XhgMBJ5
         R0wKIVv6RcpKvzFW8EOcuPZ7snbCz6LD5TTnDN7xWRXPor0YFZW0GeivTPcKc6q93nSq
         +iVcbZfPqgg0ZbhKZNCVIrYWk5O5/nZYQLSaKUahL6kxFtcPOil4IFLfKFG3U8AeQsUD
         pywzcMNe8SWEn3xtqXZ9ci4oRrxBhPzPtIAmayN58ON689zcbBPqsu21EujljjfLiheB
         tTfHdMmD9qXFaxGIoO+p2KmMdZNIfz8wnMw+FVFrBYT+jqqDjlNL1JeaXV1Ky9lOfSOc
         lsHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7K/KbYMyGDTSFtK8btkcxshp00Mh+VajLBZJCvCUzmuenZFLRBQfYbw0G2C3P0W6bcWMbiDGLFQsq6tk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eA+LaASHOLTYCGsHIJTf7rwAgdYevyLNhlft9JzPqPGL/cCZj
	5X5LyYhjlHxFMkiCyQKWFOn1zGwynkheZ51cPWBT9M3hwQkCjFWfAmLr
X-Gm-Gg: AYBFou0YWDsLiQJOhQ4JUhnf/scSephwKfF62rJS/eEJa7gVGiRdWXuECED+kpmkWwD
	G5qfFiQ3lqXn87BbEIOuh6TZ/QTEQl2QD/Xr223agQuuHKkryGbQ+UM5m00PG8ZBl9Ck+XYLG4f
	tbSs2ghK6e0tGajkB8L7YRoli+ZDbFb5WtIRDO9juMc6vI+fSkWod+CYCGQCGoxZESCCy5VINP9
	2IKyuWI1E6r/vG+T6BmV/6JB/emrvsI/YUuCI5plMnG3tSMIYvnkhycgIW25+yk7LbOu+0jOJYa
	7tsakWR+KVUQUWniyDoYfrOwAHuUZRFnX8xfac80Lp1wVsvPAJTu1PD7OW3Q/MAGreO434AKRuT
	iGlChgAe/+BXJ2FK0vBIT7lsKsvxL9eJw0nIz4czSnibDyKbeMR7Q0ByOHotKPoavVS7Sk8BsKE
	7Ek3BRKuODzWmi4ajJZdC5eUS7DZbC3D9AvTYsxeIin4N4JWBm2Q3q2lvR0kzvbozb19iWGGV5E
	z60S+ADA+RhCUJGxmPJKqksq/Yez6eIanQ94xQL0Q2ZCzoQsadO4CcE3J55elTboA2ITKhu1EmY
	Fh3bYgcSyX8XSgSfHyEy9bdWdgKQZaDnaA==
X-Received: by 2002:a05:7300:3b05:b0:369:e8a8:b9cf with SMTP id 5a478bee46e88-36a3002ea8cmr21134686eec.11.1793544407273;
        Sun, 01 Nov 2026 06:46:47 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm32747545eec.25.2026.11.01.06.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:46:46 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 0/7] KVM: PPC: Misc fixes and nestedv2 vCPU limit fixes
Date: Sun,  1 Nov 2026 20:16:25 +0530
Message-Id: <cover.1793543627.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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

RFC -> v2:
=========
- Addressed sashiko review comments
  - added patch-3 to address similar __ffs(0) problem on booke
  - fixed build issues in patch-4
  - added patch-5 to reject vcpu ids beyond the PAPR limit
- Few more patches were added. Few of them were reported by Sashiko and few
  others were caught while doing vcpu create path code walkthrough

Most of these issues were identified while adding kvm powerpc selftests
infrastructure support [1] (which is now merged upstream). Patch-1 and Patch-2
were identified while running the selftests on Qemu+TCG+powernv+BE, while
Patch-4 can also be reproduced on a real pseries LPAR with nestedv2
capabilities.

[1]: https://lore.kernel.org/linuxppc-dev/179211526968.809012.4905747914183363587.b4-ty@b4/
[RFC]: https://lore.kernel.org/linuxppc-dev/cover.1789099725.git.ritesh.list@gmail.com/


Ritesh Harjani (IBM) (7):
  KVM: PPC: Book3S HV: Read EX_DSISR as a 32-bit field on guest exit
  KVM: PPC: Book3S: Don't call __ffs() on an empty pending_exceptions bitmap
  KVM: PPC: BookE: Don't call __ffs() on an empty pending_exceptions bitmap
  KVM: PPC: Book3S HV nestedv2: cap max vcpus to PAPR limit
  KVM: PPC: Book3S HV nestedv2: reject vCPU ids beyond the PAPR limit
  KVM: PPC: Book3S HV: Fix error handling during vcore create
  KVM: PPC: Book3s: nestedv2: Free the guest state buffers if vcpu create fails

 arch/powerpc/include/asm/kvm_host.h   |  1 +
 arch/powerpc/kvm/book3s.c             |  2 +-
 arch/powerpc/kvm/book3s_hv.c          | 15 ++++++++++-----
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 13 +++++++++++--
 arch/powerpc/kvm/booke.c              |  2 +-
 arch/powerpc/kvm/powerpc.c            |  9 +++++++++
 6 files changed, 33 insertions(+), 9 deletions(-)

--
2.39.5

