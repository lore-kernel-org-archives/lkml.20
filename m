Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982436;
	b=1q9dpWljQyTMQhDQnvfk9lLx4VIwW8fzJDZnGz/q4CE5sNJhSWU2+hMk3GzlY0f50/Y8
	 /9KuSWqEGKjgwxujMkHmghqp5nxx0XW/RXWL+rgZS6dnNuKC8TSQafZYLh10GRdpBe11U
	 peO2vkWLNm8uDXzuZo6F7E5jbXXU4YTrhOEikFLTq+oujwdu1CESHKZf0rJs8WLKVZyTR
	 Ap4+EwnErQ+9hsECl8rOr0Yw99IIOx6KNE4i/4lOK/zRySTglgcfbD+mn/y2sVDk2bCnJ
	 cXM+mzhA99DkqHmUMJqV6zFG4BoEXZJrV49qawo1rD0kio5zybCqKp4KMeGzYOh8LzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4C6y5xy1IYIh608izqXS5vbmigEiY4V6zQ4vIzO8m1E=;
	b=AiUlqjlMLw0sAGNrz/2uSEQUfCLfl+eM2oueM6cgGVluPf0BlCqGUtgcGCCzkbo7hMDX
	 dCDtd4BWhN0ySTW5dcD/d36WhtbFwh9dRpUDDmYFYYHutm2MWW1rST+nQkhqCKSbqJicf
	 FeBi2VJk1zG+tgamyf9f4cqa/dnocFTM1NdYwUdz12WezjMe0bvBMD2vvUp1DJMQla7A5
	 r1U275bgGSMmz30g5ZVQ0G1f8knpEdbu8twXKakZC8RMiocl8Zhj3qLnn5Moe0kSIjDIg
	 93NSSJvhjQOtPfORRp0bddApHOt04mOWGphycy1IB+flc+l0nyP3AGZ8gqoTBrNVMxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZBQllmO;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD4C606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFD4C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZBQllmO
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-99ac154431bso147389241.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982435; x=1794587235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4C6y5xy1IYIh608izqXS5vbmigEiY4V6zQ4vIzO8m1E=;
        b=KZBQllmO21Yxtxz5zfo+UJDJRMZp11TI1KQGleYolKnWFsZsT0gyxo1u6BwGMg/rfK
         cKHvt+NQE7sWOEnZcZF0bOVFwrqHb52wQ3284jNObhLyn4+BVLhGrm6SZURa2tqKiOSL
         jmGu/pVT0I6H8ssP2S8RZoyFhTHpRzuoPe9mW17Ef2KbxDr8CT27yYGS6thXMshED3iP
         Jwpb3tlzshvHhz/a/ahy5KanD+ZoVFO3Er4zYdjiGeizCfPbrTHIWJNTNagnQveVoGU4
         a2vFTCMeU/URNS45EuFHSkLx/9NaxUwcuXF75tH2UVGKfYp6oSTL26j2oL/W3FNgq3mu
         wolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982435; x=1794587235;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4C6y5xy1IYIh608izqXS5vbmigEiY4V6zQ4vIzO8m1E=;
        b=dFmfsodJzgZJhA5bHQv1T4DDTIX3HNlrm9ExvUcOGv35RZ/+g1U75B9h0sYaunATbT
         XK0grrYpwvuU1NicW92SIL9PjefLa1qflMStsooClbEa3GX7v1CuPgKOwpcie8eEW2hl
         OzrQ9TQKIqRM7Tusl7gSgsPk5Wj6/blgCz8atBYlw+ZRhGGPBPqI+7VpsKbUYNIfaMYA
         AM7LRhuXU1dbyMA8sE9ZkzdSBJ6bf9iVGJmG6Amw+ozBF0r7ktHXsFYpP4Y9pMYfTvmb
         5xFzhRNcEaOncVfk3xUK8YXWjZ4DGz0VZ3ixAl3j3yGrh5ZBnWAcTE5b0ySpte0758Br
         c4bw==
X-Forwarded-Encrypted: i=1; AKwUvBxWgf4iAK6i12F6egwP7dUIKEWstJpnUGaJxlu5aV5qjXNprjyCfrwv0IMntaAAyxW/+51t1bhQFOe78wQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V4qxI2b2r4Lcz7pSltdf1XBNByDYPvhZWXTjnYz/z7fAD6U2a
	upAb19RDuKyaQ5ULoh6umLfrv0FuIrIBfb8tLqQn7krYtAoDzb8UU+dq
X-Gm-Gg: AYBFou3wv8wNfuqOh84RW1WviUKU0Ea32G7f2i8MxIHaAZ1AkqEQWIxnNFj9lTfpSWA
	q6tu9bn3Cc2hsKd56ocsf8NaVBHYN4v3/WBaLXUjWJj6lghfVahEdIIYlziGCRyO+NI63NaXOIx
	CQzNzQIsy0s/dY/gDmcysd/9FYhhhOFsxse5LGjZBrA/BCZX8k8ccmBjNTxyJH0Smz1nvdvkVli
	EB6TtMCTrWBArK8LZEIDoYpuybGtuAbCdiky4QYaRRa8G7kN/S4c1Cpy5U0/SuvoHO/kPIZlyVk
	aD49M7yWdLEgpyt3VGQOfXfFb5uFnKuVPC4qJCc2ornBmz25BWCpgU4kaUUHN5WmssiAOq4BJuj
	Em13uTKLbICjg0oBx1EOk1jkB8b+Vqa7EDBWFAX8BVzz4UBTDfbxZ8jTmjLVykswQF1v1IKj3sB
	75wP4yLKvmlimhKxvIvFVX/J0aYx4bw4DzeBxK9sP62JtLRCLjHLcL8j3yM4zZH/A05Hcn5HLn3
	ZtBCDOn07J8xgFTQZ0Acv6dQPEkCF4x2DvDq+WTXONx6hdMRf9JJfZFJNsjjhDSHrCdRG15HFGt
	c8VPMEiznvs/0av6sLVfNGDptntkttfPoqJESxbDIDNDnIUABRkP4EX2bgTCrG+Tko9jHWnmz04
	M5Q2fP/6bnVkNdWH1yBnozZlYAEymjufLB8v59dcB+ikGaAwoAeMzZpNqTXLmGwO7229d3uM=
X-Received: by 2002:a05:6102:f11:b0:7d2:8cb8:dbea with SMTP id ada2fe7eead31-7d2a16a52d7mr1445747137.36.1793982434779;
        Fri, 06 Nov 2026 08:27:14 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2a8b52ca9sm1476808137.9.2026.11.06.08.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:27:14 -0800 (PST)
Date: Fri, 06 Nov 2026 11:27:13 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Umang Pokhriyal <umangpokhriyall@gmail.com>, 
 netdev@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com, 
 jasowangio@gmail.com, 
 andrew+netdev@lunn.ch, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 linux-kernel@vger.kernel.org, 
 Umang Pokhriyal <umangpokhriyall@gmail.com>
Message-ID: <willemdebruijn.kernel.388036bf83dca@gmail.com>
In-Reply-To: <20261104174240.138491-1-umangpokhriyall@gmail.com>
References: <20261104174240.138491-1-umangpokhriyall@gmail.com>
Subject: Re: [PATCH net] tun: delete the flow entries of the moved queue on
 detach
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Umang Pokhriyal wrote:
> When a queue is detached, __tun_detach() moves the last queue into the
> freed slot and decrements tun->numqueues. The flow entries that point at
> the old index of the moved queue, now tun->numqueues, are meant to be
> deleted, but the call passes tun->numqueues + 1, an index that never
> exists, so nothing is deleted.
> 
> Until those entries are refreshed by a write on their flow or age out,
> tun_automq_select_queue() returns an index past the last queue, and
> netdev_core_pick_tx() sends every such flow to queue 0 and warns:
> 
>   tapq0 selects TX queue 3, but real number of TX queues is 3
> 
> Found with an LLM while testing how a VMM detaches tap queues when a
> guest lowers its virtio-net queue pairs. With four queues, 30 flows
> learned on queue 3 and queue 1 detached, all 30 went to queue 0 with the
> warning; with this patch they are spread by hash and no warning is
> printed (3 runs each, in a guest booted on net).
> 
> Pass tun->numqueues.
> 
> Fixes: 96442e42429e ("tuntap: choose the txq based on rxq")
> Signed-off-by: Umang Pokhriyal <umangpokhriyall@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
