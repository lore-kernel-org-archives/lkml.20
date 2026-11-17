Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874158;
	b=Av4nixsKlg7CptkgjQSqCqJV96Frqwf2yLwa/mChJ/mfWLzLhF5wTSqFYbfcIpDIJiDW
	 Fa4m9tsnrtzan6BLg6BHsLj/gym8H32mnguf6j2H1mtROBZ84/TmUYrNS3xXwvxhnnFAw
	 cSNZN3XZM7aoGiGD0SbLKvJcbM2ZnA9KHpy9IX4dLAsmaaEkdTwg3JEQAbZ7JQn1TY8O/
	 ckZ0MCouvD2aGodvV13CRkPvOLGk4Fn780lsL1KRBMxePtVYc8mgLfi+KPJMyQhFcQf3V
	 q5AtubEDFH79YsAR04H5IStlzhtg1fMbr9Fb2aBwAcc4hyJNR7gA2aKY+SBbVCPVZsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pTrfmCeHoWlhZKSWNZnZzfNn/A6ww2uD6ITBjAv/o7s=;
	b=xIvc66vfEAILBCcy5e8HcXu9ElsVJROs6ws+ntWqUil31fV9H+yawlWOvlREKNy7Qyrk
	 bUiJACiqHUf+AgCzbjfYS7thV0X+95x7+PRx8Ut4lypS3Yr9l5HZPtCTB0FBCTmS+R9KD
	 HLNXgeMS+CVQkiu8JlWX5Wkgch3H5iuYGMQcB2wDIph1uhkxVwdL78a1qb/IC45EyOLRF
	 vJKipf7Dpr77JBHe6lD5YsJzpBIXZqrCqP1pLVlF2fcS8vV4l5XJZBGfI0dKls5EefZtE
	 2/GFP6BZ2hN17lh4qWZ41VxEiZ2A7Iy1U7uDDekCYbQCkvMhKiUsNCuwL7Adnwp1hsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dntHVw1v;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602F6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 602F6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dntHVw1v
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so4930321a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794874157; x=1795478957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTrfmCeHoWlhZKSWNZnZzfNn/A6ww2uD6ITBjAv/o7s=;
        b=dntHVw1vYt0X8rejzm8+5Fc++nZ4b0a9A3nHB5izEFRQ1xt01Lf6SpVFh5sI6SGQDq
         wYjvrawQRDLG566kS9e6TfF6DWI9JdBKxWWz436fDvYxQ1K/tlAQLdG9MuP85zuQtS5/
         m6sPxW+XgJuUdmlysOLDCAIELFhH6ksC28fMJF2ow+5OSEBjpNVx6Vv7Wi/SPLJIEG9w
         KjxKsw0YBA404XposGPpkDLhXcQNXVjH2cReHPHy5KSTi372KR4+BD4Noyi2C2p7s1qx
         ezSTdpQFQAd5Ia+yQRcfGthS2ODUaSyZ4zF5mmipFb5GMWMu/Fxd9tPLPtYR1KXlHyTN
         HnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874157; x=1795478957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pTrfmCeHoWlhZKSWNZnZzfNn/A6ww2uD6ITBjAv/o7s=;
        b=fZskUH0XIf+wpLCTMnEUleZMpqqa+SVuLS7e1MZwiub0wSVeEBx2TUnU0CDvX0ETDV
         7mS5K0ndeogQhDeMH6OzwSYK1rM9oATHtHntIqjIyX4fIvpatfMLYA1tK0Em4zAEVc4t
         FeSi/G6D3VNO7dHhQ/D+YVc+QkFn9xVQ0HCMP6ayajelLQyS5HoKATwgxOkGFI/JYR1v
         2VKA1SNtDYOVLTfPU6xTm2eguZrPh+moV5EXZUiXrWJcPQc3OdOl4x/NA2HDak1DSvUF
         YGrG1JrJ9kN1KFpUFrjenUgNAdmt6rUzrQb2gGjjElytIxD/WDv4Ghx9tpgN4bBkORmS
         +bqg==
X-Forwarded-Encrypted: i=1; AL+hErE3KpBNrW8bPRda9p3H14VLRtE0JfD3vQssHQuhfnqqVe6oiuIcrUy+zHm+21eUeahPIXPYg0i1e4O3Zls=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f1WardO5Cu5klqVf3Oi5T4XHeRIPTGKSvr3QBzGsk+muOfymE
	G17KYujyoVb2VRbPJyAf2QBv1i/MpVykMMcLd52TWFipbKZNDfVdDgrzySeX7A==
X-Gm-Gg: AZFdTZctbkBOjsKzC7Yk7joZ9HDVwuuhCLlXs1p7/CuELLUbfRHN9acL4HQ9nKDw6PK
	+j08LQQDyh7U6wrCkZHUDLJHvarI+hYqJJmemhMde9l/Cd7/6ocDzyWtYVWxmKDa+4EK2fuajM1
	MDiDrTEpPS4URLwtgGX09Ww5WA/J7yvu4pkaeXF9z8wBJWqD40qmOGa0NCTHpwlmuibizCX7xtZ
	0POIr9MDzIBCDyn7y83LsknE+CxpeqTBp42PqIZsRd2+YRzAhqOHe/sHsGu1YjqQypXICAGKNIs
	N8xOzg/bQC/2jjVjsVAtB4NpCgAQoLhtppf1q3+Act2xjyLcTDiY/zKvL0tq+eCmq4oSGouaYl3
	NBcucAv+js/DCnYTSRH6mTuXOphmGK8+11juck4tdY5Nc1TViYbwlpRFpyI0219hqwwWC91qHiN
	cI6XVP5TVPJys3MKUxnCSQrYu5xzYEjN2Hsm9l4YkoY4dZLmsGTcoAzHClDEYE/kU7BJpu9Fco4
	aXDaMWPuQE0x4fNvPiN6SRNhMBk/dDJ3TSYocrqZZkyvvnO2OK6TeqqhiG9SfTD+49L71UIAmf8
	L5a6M9N3ttBqbxpWPNvLEJai691TACkBrEikRf76uS4x4p3Efaa5/3ybyK8lWNTxFLceB6R9dfZ
	wNOoZjG9lT/8+p8VIhQWXTcREeomYy/vtfD2LMoWLX+pgGrA3yVtRMHs9IA8RLICzb3TAvgypQ3
	YouGnHXcI1naF+ILZuyBi4wjSu/+cKgkg=
X-Received: by 2002:a17:90b:2584:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3b1b0ba61famr10684993a91.33.1794874157570;
        Mon, 16 Nov 2026 16:09:17 -0800 (PST)
Received: from cs-arch-srv04.cmpt.sfu.ca (cs-arch-srv04.cmpt.sfu.ca. [142.58.10.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b25a365asm9273069a91.1.2026.11.16.16.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:09:17 -0800 (PST)
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
To: seanjc@google.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ma.mandourr@gmail.com,
	pbonzini@redhat.com
Subject: Re: [PATCH v3 0/3] KVM: nVMX: Don't clobber VM-Entry instruction length on soft INTn exits
Date: Mon, 16 Nov 2026 16:09:16 -0800
Message-Id: <20261117000916.3904913-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <avuF8vW3g_o1t5DM@seanjc-mac.roam.internal>
References: <avuF8vW3g_o1t5DM@seanjc-mac.roam.internal>
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

On Mon, Nov 16, 2026, Sean Christopherson wrote:
> v2 still applies cleanly, there's no need to rebase.
[...]
> TL;DR: please be patient.

Understood, sorry for the noise. Plain git am failed on patch 3's context
here, and I should have tried -3 before rebasing.
