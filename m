Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874166;
	b=l4sX6vE5N1ylOwngKBulIhmL1rh+RgCLefjORHT9JCCpGhicwHjjJxcbbU7xE+K0rlAR
	 hjXrLoyMRyC8xvl7KuKfO7KSlWGPnNqnXWtAEReL+g5d7+VQ4Uf4YAo78S0Ssf4q5Zxj0
	 uVUth4e1RQ8JaVnNEk+O0kfqIZrusN5psiMsUoRo7nvlR02zKuIM4TfvWAVfmBJoDkueU
	 B2seSy2Zxa+LAcYBPGK+tCbziw2vTLK4rd1lqPr6hcIXAVRPPP10cZ010JHOmfwdm8hZi
	 P+jHm94rW/y/ocxeV2AopeKWvOnpnhDL+n3yDfrEvo3s1zUCRwNXsbNKBviwgjpRtBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874166;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mA0JUWIMJDLe3trqouiE/a4ohypc9UC+FqDIAXVqBsQ=;
	b=EgLT3i7YXV+ZGr1oILZfBUm+dbhAU1w154zzMKKb+MLPcPKmpLxV4cc/sPBEb+iG4HF+
	 AMfhqzBZPsfhltCFGasrNcGlHpqMe0OLjoN3AlwLQ0wZHwubupeZqopvxbevfOVCLFw6E
	 LHtNXBiXkmsHNPC9u4OXY2sUYfislTkH6pFz9btp7Tqffd5Db06gaQt0RCSowKRJ6bzav
	 bg4T+Hag5en/1t4UW0CyiOCyuT1xJ4nhPpDLFNFbrAN5KZia4z49HoED1qYHNWOJw+mAi
	 s2AbOPIFzhG2h9RBKgtDAlgYWLYCib9CFklF+9+5tkE2FvqBPyQFS4RA+ynfw348v8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UeONTUv0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="qC/e/HgG";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97709606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97709606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UeONTUv0;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qC/e/HgG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793874164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mA0JUWIMJDLe3trqouiE/a4ohypc9UC+FqDIAXVqBsQ=;
	b=UeONTUv0UgbS5IUIOd2M8qcgqpI9bup4ehO2VCa6ewq4x1MYJAwx6ft01Ive/vgQPmNKGi
	B51756vtLbZspiZcqvueGLxArHlu9yOJClOBjaLP6vE4o1QQ0BOzwHKW5U1uCH7Pzjg5H8
	g0ToCWbB9ajtcd6wwt8VLJXy45ul9hk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-qvs27NRePROeQkdBceFFog-1; Thu, 05 Nov 2026 05:22:43 -0500
X-MC-Unique: qvs27NRePROeQkdBceFFog-1
X-Mimecast-MFC-AGG-ID: qvs27NRePROeQkdBceFFog_1793874162
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-490d2ac331bso969479f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793874162; x=1794478962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mA0JUWIMJDLe3trqouiE/a4ohypc9UC+FqDIAXVqBsQ=;
        b=qC/e/HgGDYx/2Lh64K+89w43sgmoFIHWuFrBEhX60rDYwVSNtChRz09WqDqoa22QP3
         e+RVTc/axkWchbGnZ3bhlpNKuPgym35DUljxtawDPCmFsmx777kOCV+ov8IzqAcZ/zCj
         +m61HPAOhT4aaK+kunQ9lvKI9eb7DRq/zTkCF88XFdg8MfS59WYJv2wsJlIs17ttGDlZ
         l04iU5g3LWp2lj1xaCjSfMW21OaWaWKSyNo/7BhXdOUfvHKpt/gxvo16mpMSe4BDPBED
         6KeLgf6F0gh81FV1kkef3Co93QjgWMlUFqLJ2atYtMmUIreGL0IogeUNiQdWbznpjUJa
         UwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874162; x=1794478962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mA0JUWIMJDLe3trqouiE/a4ohypc9UC+FqDIAXVqBsQ=;
        b=QVhKzJLlW4ljJ7kaYpPLjKnURL4F6S+8/7gMOC7vwIy679QvlZ8UIkW8SdOGZP50EK
         OMKJPkngWb9DsbyHStq2oBI9m7/SVrn75YWQ0cWkmie5WXaBq+ridNlJCATntxvZTxnM
         7H6td18k2QohFQGv3QdpTUWs9cx55TAT5q1uXf7HUu/KF5rdo1qBn/vztQv37YLlRn6F
         VUv8N00N54drPhvHz+lkflqLqWRjdYKRdVTscEmwqTDYYILL9YIDoH7+LyGUh+KCrBpV
         PM544QsynNGYOnCWmJK9dMA0pM5woTnV8LZKXhcZyPEwymnIhgo3rN2nnUdpZ6JnTRjy
         uY3g==
X-Forwarded-Encrypted: i=1; AKwUvBw3QCOWNGj5eknf54zsVs7ljU87swBmBt/W/9Y2hseK98G2aBg44iIY2trh+PTdD60uFuWI/AUZnwhHB1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FBDN/RAneSid9Fsq230jBVaYWmjNP/7z3biZO62lwYHOYYo92
	Q5oSVRWbyPKuXXcBSHZ2bn4dd4YxukPqhamnX1QmDdFiFzmhp0W5qjaRyOJY9seheiORrInMsK9
	nZ8j2bx8kY4yRqjNjd8it4pDNhGOOYXe9qU/HhPC61W+ubN7uqLJGxufm5qKzuXlQFJ5RTYklUQ
	==
X-Gm-Gg: AYBFou0f8Cdhr5vwMcfiZalBrRj1NvnA6HeFnVAvU8c19AmsuRodXVaMGipXIrsRNvf
	xBYRd4BHVwibfgP9sKzVteT/EsyK3BKCugg6u0x/hhiZSQcpYvI1CI1Tva05+jWyQIwUak0+PEd
	dAnRMtWBCd3v1QH/FpxS+RD4++/oXo0yC5naQ64w7tatyxKTkwCGFxxgbCS6kuWcuMJCcirLf53
	Mx1+zM19RueSTLRNK+NIvSUHfr3xA8KuSsaUF0GStrmge2pPvCDJV6/0tcG7921a5JxPFcMusqu
	CYjdeTVYOZoxpnfvEIrhku6PD2U//5ZUpJ5gkCIAlbDlGtGdTCdMShkgblO1z4R91NOgIBwdwo3
	Vunx/Wgjro0YcaiIFjpZKysBJDW3cD1zfzB3pT4uCJWdX3q+JfHwW
X-Received: by 2002:a05:600c:c87:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4ac186b1a2amr423568195e9.18.1793874162221;
        Thu, 05 Nov 2026 02:22:42 -0800 (PST)
X-Received: by 2002:a05:600c:c87:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4ac186b1a2amr423567735e9.18.1793874161708;
        Thu, 05 Nov 2026 02:22:41 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f0237aesm56586085e9.9.2026.11.05.02.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:22:41 -0800 (PST)
Date: Thu, 5 Nov 2026 11:22:36 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: jrmmhm.kernel@eldare.de
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Michal Luczaj <mhal@rbox.co>, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH net v3 1/2] vsock/bpf: release sock lock while waiting
 for data in recvmsg
Message-ID: <auxYWGV4l-xEAajy@sgarzare-redhat>
References: <20261028-kbh3-1-022-fix-v2-v3-0-bc0752b2d3db@eldare.de>
 <20261028-kbh3-1-022-fix-v2-v3-1-bc0752b2d3db@eldare.de>
 <auSkQOU6qmj0NPEt@sgarzare-redhat>
 <179381093020.9.4719932034061956856.1746278795@eldare.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <179381093020.9.4719932034061956856.1746278795@eldare.de>

On Wed, Nov 04, 2026 at 04:48:44PM +0000, jrmmhm.kernel@eldare.de wrote:
>On Fri, Oct 30, 2026 at 03:18:10PM +0100, Stefano Garzarella wrote:
>> Ditto about commit message, please put more effort on writing something
>> readable by a human.
>
>Agreed, I'll rewrite both messages myself for v4, much shorter.
>
>> >+            if (sk->sk_err) {
>> >+                    ret = -sk->sk_err;
>>
>> Why?
>
>Same as vsock_connectible_wait_data(): an error that arrives during the
>wait is returned to recv(). Without the check the loop still ends, since
>every path that sets sk_err also closes the socket or sets peer_shutdown,
>but recv() then returns 0 or -ENOTCONN instead of the error.

Please add a comment with the reason.

>
>> >+            if (sk->sk_state != TCP_ESTABLISHED) {
>> >+                    ret = sock_flag(sk, SOCK_DONE) ? 0 : -ENOTCONN;
>> >+                    break;
>> >+            }
>>
>> I'm thinking if we should split this in multiple patches.
>
>From reading the code, it can be split without breaking bisect: first
>loop on all exit conditions with the lock still held, then drop the lock
>around wait_woken(). The order is fixed, since dropping the lock alone
>brings back the early -EAGAIN, and the loop alone does not fix the
>deadlock, so both would carry the Fixes tag. That is why I kept it as one
>patch, but I'm fine either way. Split it like that for v4, with the
>current 2/2 on top, or keep it as one?

Okay, if the entire change is needed to fix the deadlock, then it makes 
sense to have a single patch. Please make it clear in the commit 
description.

>
>> >+            if (!timeo) {
>> >+                    ret = -EAGAIN;
>> >+                    break;
>> >+            }
>>
>> Is the move of this check changing some user visible error?
>> I mean before this patch it was one of the first checks, is this okay?
>
>Yes, for non-blocking reads, intentionally: -sk_err, 0 on peer shutdown
>and the not-connected result now come before -EAGAIN, as on the native
>recvmsg path. I'll say so in the commit message.

Yes, please.

>
>> >+            if (signal_pending(current)) {
>> >+                    ret = sock_intr_errno(timeo);
>> >+                    break;
>> >+            }
>>
>> Why? Should be a separate patch?
>
>No, the loop needs it: with a pending signal wait_woken() returns at
>once, so without the check the loop spins until SO_RCVTIMEO expires, or
>forever if none is set. I checked it by removing the check: a signalled
>reader without SO_RCVTIMEO never returned and used a full CPU. The
>native path does the same.

Okay, please explain this in the commit description or in a comment on 
top of that check.

>
>> >+            if (data < 0) {
>>
>> Why not data <= 0  and void the other if?
>
>Right, will do in v4.
>
>Thanks,
>Jerome
>
>

