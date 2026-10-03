Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22B01D63E4
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 06:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791009945; cv=none; b=sS3HD9rUIt6UELslbZuo/xIsUc8lssz5s3fdtVOAvsTaidQnfOzimnDsBRqwrvShXMf5ujHoUF/4eErjqbSIsejaxjpI7PwlpQy6UNQnw8XDTMVCOPBTnwmlSr0JN7nwqHGF7LQdKOLBfBPk3cvBRsib7qGffOBSWi1KF9w0q4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791009945; c=relaxed/simple;
	bh=UaD3I2b18bISdUANA1NJwXoHAKKgZBgwLSormdRjXBI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=j5lFwjtcYjbz8HP9oVBAwleA+jwOf2mBVq3/iYw6qf5hWCs2RTQmwerJRj/Jc2slV0/o0sX6hazpMjbOWIXJXdMlFPf8AYv9Fvz1t8FvVg8kZzaDSeH1Smbrdz9DD/tbsfXsDBAT3/tRS5ZxqRFV4u/fl0c8t1HoueuM5t4DTNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyzRzQ3i; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyzRzQ3i"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3510f6f130bso44392eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 23:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791009943; x=1791614743; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UaD3I2b18bISdUANA1NJwXoHAKKgZBgwLSormdRjXBI=;
        b=XyzRzQ3iSZQuxAchhxpIxcPfV1csnse4+jNMnsmlAoqBf5pAjiklo34px9+3b4GntK
         UTQK1WzB3OwZ2PeGMcNjc3CDHpEXoHQAp9W0XepwNQq0Lvv+DvrVPcSA2i1Da5ThhCCE
         nSeX8ChIHIx6eswyotoKakwqYO7gZdIqvqldR/zAxoMeadA6xLEFVWiWdbRqNss4a0TB
         UkZbcRxj4avATP0cg6apzkfrjiVhbIF+rTb1XANaMZJyZZVP/U6UfRCq0/3xMmQUn3rs
         8dQFcJ2FyjNp7l8UXbMq3QDyymm0KPlnohU2CQYPfQ4dthZFC2f+ogmg1J7QqtDZP6Za
         P/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791009943; x=1791614743;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaD3I2b18bISdUANA1NJwXoHAKKgZBgwLSormdRjXBI=;
        b=VKbAGbITKh3bqguT8KcNIyGctLQr9z4Z6TfsOsyHod7xfgvG2qACPneAeISf1G6CBs
         Xrk4H4AdZnC7PdS8nfbnx+VJiJF9n8wxo5seXqNYRWUcZRYbTQZNchKN0lTU9IvX4kWa
         BJnUr24l4K/5F0gmVYW0FUY871zvf4kgbIfcutRa+BcCQ3rrhAjOO7m1lgm8fGrc94LD
         N/TZk0dNGMnOjrnazrdJBh+yLn/XWd03wCl1fIVh4kCnX+kJA3/ZydRRRQabIOmGd9o9
         Jbez4T+/V4BMSkNWsMtbLOR8WHy8gg+fpumYwkipbKaKB01GjFvrPkVJqDTlFOz5Hvnx
         LOVg==
X-Forwarded-Encrypted: i=1; AKwUvBwce0tCvP7QcYxahalHnposx4Vs1guT9NQ6AL+kXxZMAtlexTC4rEN7CrYMR/6Mh/i7sxvcK8ROlb0M6rs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtjzAHQH0YjKGhR/BlfXHZI+vnK4jRZ2unfDV67rjrXB5GmKWS
	cP75+0wc4IakT7w1Ezy8QQeGRlNIZmNZ8YW6hnPzeLMZmxnuwjJP+e2VxSfEaw==
X-Gm-Gg: AYBFou10ETzYTnqzB58xcp1c7rtWFldxSfxq+gDOP4z3IHv8k8kS6J+4RuCUkvE0uC9
	sTYZbkG/YClXVRUbVOQp+Mbk/OFqebSsoGfG8EkEtRgVyKh2T+QiXx408+QgeTrzP7CxM4HnQbv
	4/sqbapGbYN3pFmy+iqlZolg+qjHR/2S/NZyBYTU7Kn2ew3+fPiWfqFZN26ZCzdCs8kJH3DmmlW
	AHLLjuCE0Tlp/RgnfaTM6ywRO0i8QKekpYXzDyGYtmjRHjRP1gHr5QwITGnsQMIkJTYN68oUbRk
	cR3lBquJ1KCaGGM/9ec3w5vXE/UQ8VrN/66g8ktKOxB//ST7CUKI/TZFmUoAoi+TEy0ZdwG6PE5
	naa7sI1YDGOelLXN7YvhuXi48+6zCbwBFi+EtIBHCcX92/EOTZO0niYRAuk4xnLYGP8HChHqkhJ
	1WuHVW/afMr6xmYqcpIjH8NzfyIRWO204bkmG0inI+/Iu3uG6HVUU0ekpKwVLjgcCgcvOldj4EY
	vO8lc0WO2mF4mPl8fd9ok1cwDfxzi5izFg4m/+AqG4nHij4/bKSDC2CsmSM2+FV
X-Received: by 2002:a05:7300:f801:b0:351:1170:3481 with SMTP id 5a478bee46e88-35111703551mr2454740eec.29.1791009942568;
        Fri, 02 Oct 2026 23:45:42 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3511b6f3a32sm522073eec.2.2026.10.02.23.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 23:45:41 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <chleroy@kernel.org>, Anushree Mathur <anushree.mathur@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/9] KVM: selftests: Limit the number of VM creates in hardware_disable_test
In-Reply-To: <asAt1NhGFs5HNbvl@google.com>
Date: Sat, 03 Oct 2026 11:31:23 +0530
Message-ID: <ik3jjpak.ritesh.list@gmail.com>
References: <cover.1790101179.git.ritesh.list@gmail.com> <db32438dee67a69609e75d8c43cb070f021137b1.1790101179.git.ritesh.list@gmail.com> <asAt1NhGFs5HNbvl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Sep 22, 2026, Ritesh Harjani (IBM) wrote:
>> hardware_disable_test forks several VMs (NR_IERATIONS=512). This patch
>> limits that number to 4 when we know that we are running in constraint
>> host environment. The number 4 is just a safe minimum when
>> kvm_arch_vm_create_may_enomem() can be true.
>
> Please actually explain *why* this is necessary, and where the magic '4' comes.
> I assume there's some system-wide resource at play?

Yes, this is the similar issue of limited resources at L0 for nested-v2
case. This test actually forks and each child creates a VM. Here, the
parent queues the SIGKILL for the child, however it does not waitpid
before the next fork. That means the VM can still be eating the guest
management space at L0 for the nested-v2 guests (until the VM is
completely destroyed).

I agree the number 4 is a bit ugly here. It was just a safe limit. I was
able to spawn multiple VMs ofcourse - but for the sake of enabling this
test I went with some safe minimum.

BTW, since you suggested that in the initial enablement of the kvm PPC
selftests, we need not land this hardware_disable_test, so I will skip
this for now.

-ritesh

