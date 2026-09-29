Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9400A2D3EF2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790646664; cv=none; b=gO1vN6FhtLiH9iUcyGSdK/77tOJP5ZczMjxjRRMG4g1M+GN7iVUy8TO9MLkmBoga52lvB1HRcMsbRyvWx7MZiEYHzFwGumeh6uv+evIDe2RxSCRtcT9WzzmCXhfoIlz+UMTOSnTGygvPeVovXhH9njrVz9J7KNbo8xrJVR8nKsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790646664; c=relaxed/simple;
	bh=defNTj3mi7sHrxVRjwLhgcyKIEsYh8Z0QM3DyUvlMZY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=nbqYZEzOCkTiX7qdxnXlufLPGPvVRX7aSqC2Z8Nh8RRpGgX+JgZg81q4H6h7H9vO/1WT+oiNyDcH6xJODrHmcy79rjGQGSLc0heW7CYhs/KDfLXVAw+iz0a6I/8wFvleIwTWIwtw9ePA1xpr3PLsgJWLh2+H015egwq2rNqh4q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYdfRjVX; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYdfRjVX"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-346c612c7a8so1350157eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790646663; x=1791251463; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=defNTj3mi7sHrxVRjwLhgcyKIEsYh8Z0QM3DyUvlMZY=;
        b=RYdfRjVXpbTw7L3wRhICKCh3QlSOKHvAesv7oywwmYrHWcuKwR6xfkTXQweTCEjTRT
         hnw/rtGvr6B4n5kJTrxxbBCfvawyx35lbblf+IcOlH+0rgJOtSULDPfOQBWW9Y0vIeOS
         POIqN8cCIdvaT7Avv9bQSrcKC7mj1OuF1QHbkwFp5Z4zbIFBU+/Bzo4oE4xYFqlsnhTQ
         FilGgaxCm3kXMjlX9rarE/3/ZSErZcvcsBY5YXKjWVMoZiSys1kM132ny4UPGb8iqKFU
         YNWB2eHjVfWCms4RvJef4/xVIGNc1lEGkmFbPG5mabLi52feZDTQ1Uq66ErfC7pu5V60
         ugQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790646663; x=1791251463;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=defNTj3mi7sHrxVRjwLhgcyKIEsYh8Z0QM3DyUvlMZY=;
        b=ZcQsgPg2DSjWXkDG//KUCg9vO6okrdhs0izlfncAXfhtegiGGhv4luADsKZ/Q6U/nP
         oZMHW5nc4vrgPu7aiu6FxYXP8T64475Zv4v8iZ88kQeR7NfRvpMPW/yZiB8mITRHm7DC
         p+0CNl+8mcga4jvMZofJo+mCIDFQT8B9KfDqgo6os77KGyt4oYKsZgedIbu4nJoMJD3b
         RJoDUhJyQCPHpHfLpPWWLbWba2IzDBqxIdH5i81d0pcWOt3teKAB5yiSE72/OP4Z4qj0
         EAOLZ1MvbnqehpCIzG0M9hWwZrnp1GYXboHnPS/pHyZqHOgv9hdxzHT9Q6Y0vKCwcPRb
         wRHg==
X-Forwarded-Encrypted: i=1; AKwUvBwL2ZlgJyMenB3bmUwI/F5dddapyapIskFOH2j7P7J/RzoqOXJyhjrIyN9EJZXs4pSoXBeqm6hhTOb+Pk4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKShocIdfU2XU6DMManjMfFQd84YIHhmJ5Onzb9pLcG6bFJpFn5
	5Ih/LxIFCPNjJ58KyVCUUDyfk7Weu7YuYkAqdsprhhKDHV3Lxh1f6ysP4NCk0xLU
X-Gm-Gg: AYBFou39iTaApadnzySWbbW60Yew9elIGxshY7kySjSET+vSmbSb5sZmd4YtJ/oxhoY
	kPowcE24kVYu5PKV4GW41V6oQcXYFmHRSUL6V6c53qDPi+yp+A7VZ7XkPZ2s1+AYSpNSXtsVpaH
	MsHfkZbCrF30wS+GmHgmu8nJQs2xBoVoaA6kU/gf7Bs710eDmsYVenlohHE7V3aqlfxgGslij9U
	XeQ3PQgRMKSQJkaS8YRDQu223EVNLFxyWDU5vFN/cJtY+MoabuGoMR6lnPVXA/05lsJHDSsHoE4
	a+EFBIpkFbgRQMaLhmXFbPW5Gh0VcgDG50vlY2JuwUREHXOxYuFror8CZeE2MFWaoLi4z7QbzME
	+8rwDBK1DgL2oSfyIUDWAkmqh3WigSewGcdVHQAL0vL4vrdZ8wwnJ5ta6zQ/zXH3P7wvVuohnQk
	FBAuY4l1a0bAx6FK0t4XK0auD8wUNsH0iGQUcMbppAf+uQ1iy8xm8n46ZCzQX4KfgMJAbgXktVh
	eP9xfCTva2XGEQYwPT7RiMhJQ+bjODHn46j9PbuCWQG99k4vtxzlHutoeFyVVxN3A==
X-Received: by 2002:a05:7300:ed06:b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-34739c07e6dmr8293196eec.21.1790646662193;
        Mon, 28 Sep 2026 18:51:02 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341f2b18cbfsm29834837eec.30.2026.09.28.18.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 18:51:01 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <chleroy@kernel.org>, Anushree Mathur <anushree.mathur@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/9] KVM: selftests: add powerpc support
In-Reply-To: <cover.1790101179.git.ritesh.list@gmail.com>
Date: Tue, 29 Sep 2026 07:05:35 +0530
Message-ID: <pkxwkffc.ritesh.list@gmail.com>
References: <cover.1790101179.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

"Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:

> Hi All,
>
> This series primarly adds KVM selftests support for powerpc (64-bit, BookS,
> radix MMU).
>

Hello Sean,

Just wanted to check what's our plan on this one? Are we planning for
both PPC pre-enablement series of yours and this one to be taken for
v7.4 merge? Do you think this can go in too?

Thanks for your help!

-ritesh
