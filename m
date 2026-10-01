Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B86376483
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876741; cv=pass; b=YB1GPJX9ZCmvcQELlfBaC//FhoSmw62M90f79b8ACUIiwG/wElI105OgkgZwjEJa0rv22K4UfmFLul28YbNk5/cajW1Jpn81rGUiFTqzNyVOnBiCawuv2krHzIhgPaDIipa426lgPzcBTR9KrexVYOH1SYDFpuQMelNKdD0dHf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876741; c=relaxed/simple;
	bh=DVS+yU4MeXSTJA0MnoG2/WnDRMIiZcABsJSeQLqj3C8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aaDrJ1GKgiIL5YklyxWB0Z3U6Zx4d3hThIhzbiyZkJ4uCEjxiLpDQbrr5RpoN6vC8FOFu1aaFJTpW/5W9FGkGY9os9IyOvKHwslbtRdoNk0FGn5HVvbQu2oQUAy0VkKomVjuXRSYxUrckg3dzmhkCUL0Gz7Or5mm4P2l+kY3eWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CXfqQQXu; arc=pass smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CXfqQQXu"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14e1fe551c3so911604c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790876737; cv=none;
        d=google.com; s=arc-20260327;
        b=oBYD6T0E07fvtl4c24sOtE170O/nXy6P8lvnFJ0EJkCu47oZa4FBL6/5XOATxZfVoB
         ewhJMOW2NM58JJF6zkXfMRclzOwHjsZX+hWyHKAwdv5gPKpelVB+zSOlTmY8dyajqAIG
         JNQk1DEdmQ0g43tXvZqswWDAwA4araX+JGxxilauNr36yA+8Ldwjhmz99aL+U9cyGi+B
         KcfrUPLulvG4J1913guWP2YVkGXusjdaOO3z/xF/Fcv8ugN/AGC/xNTuoewR8kAi/7QQ
         9MPa30ttFrIl0B330Egdnxm/gZ8Vr6szqaTAcOkMTNeTXXwocPBZBUmCmXwuCvwdlgZJ
         kIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kd+gDsb79tDRiS43i4aFe0o9+muNoh8xdfZbWxrNkr4=;
        fh=e5Jv/SVbMmxQ9/wk9nNCwRW+fLXH8mpBvRbVOxl8EMc=;
        b=csAU+1SUSJA3lQqq0B57aitwrk84D74/3psxnWgKBQuM61D30RnnxM54STNN8HoU8M
         oQMs9QPxf+JIU8fwLP6KDdxeWB1+16NlMaZgWoXdR4T1OHKwfeIE9ntuojj6jQCGb6E/
         NDNlCIIgfLcesKXK7/g52VNTc2qssQTqsLzvSa1kJlD7WjzhIvjl2nPpWVx/ZQxsJlk+
         EG4Rwzlhdwg7oDaWAortQjrTagqRI5/mk9PHC7ZyKxyOc/Ywpi4a9XyeKe7WndxZZHHV
         V90Q7im+4fF8iiYfpnGlB82k7vuUTTqW6Aj8fJe0ccEWQ2OJuAYc+B8HNphhIdMfXTBl
         JI7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790876737; x=1791481537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kd+gDsb79tDRiS43i4aFe0o9+muNoh8xdfZbWxrNkr4=;
        b=CXfqQQXubnpxgTH6zg6wVuh1/JFqqzU/09wtg7nHBjucGOvSnsW0obUHgU8Ka6r+O6
         YM7ate41qmImXWLsp12wECInySar2PF46Rwp5l7EebSEEdrvLe/KYCGCJLn0JIqB0+gv
         sMn2KStt3690fA1ZWbhnuhjDl5dMPK9dDLzJscjsSc2pvOzJ9rrV2qeun8/4uGABd6Ze
         4vr/rYVgRN4E9A/Uto3ADqdUYTAiLyeooO572Na21rsyXY6pf5vzIcl6Ouxqo3zp0jmY
         uXr7Vmq9gHH7//7hKsV1uLKMmRlm+XhXPtDCHTXHYGzbHGb2FOn8Xyk6OdfkMmOlP4Eo
         Z4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790876737; x=1791481537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kd+gDsb79tDRiS43i4aFe0o9+muNoh8xdfZbWxrNkr4=;
        b=POhLto0+ZuhPornOxlvCBiEZy0rx/2+yXvPeShsKVoQEUcKuqYcck2IBNafDkJAOU2
         xXGB88/ig9a2qKzCoXrO9shmG0OvSaY3ue4ItMI0uQ+2vS1FSC/vp9IBFtknonyKys+r
         wedFQ0L2MBch65zis3uGrJUjdm+pSGM575xKuG7bR+3ABzeA3nX1VCYTq+zuZ5V7SP1U
         VmcGPFrIFWk1Zuyu0LVJbqA9XyBYLQIbdDjF3OWf5eXxHEi2TBRFDKzvP6V4VwTU9prw
         tmY0Q268Ulhq/+8Ep2V2gxgZ5vwve7p4Suhktr1PLH+H+hmNsnJjZIA+MEB3kN0V3n8C
         v1jQ==
X-Forwarded-Encrypted: i=1; AKwUvByZJ3BAWZWnLIQWjt3D70TT+HpkYvbbH10AGu2E1J5wTXg+G1sPMdJOiikWo/S+leXNcnLQTSMSAHY4zFI=@vger.kernel.org
X-Gm-Message-State: AFuF++mCHHFy8d3QRX922gD8RQNjGdV6IvCXTm2HT0o4sgo2wkD2aiKq
	Rff49DCO7hwbKWr+dfTOQ0cru5rAwW1OG6ilNnaGTRid9FIX4a3nuY21niTwPJ7BBZRxcJCKqMN
	NRTAxsxhLDoOuNdptVC4uBzj2Q8eIQNSYP8Tgu2aw
X-Gm-Gg: AYBFou3Z60AQhPdKy6MTj21gdLIrsC72EZ8CbxAXc3hctMRNFv/970UGqsiglFw0frN
	ZBiWXFszigLxUDhL7H+e1p3dJOPDZ/UEOPoR/OFKzB12iXNc4OAlw2xo1r3zLcSD0stY6MG7VY0
	r+P9mcEABiMrCMUzX+8CbEHdX0+uWf2psKKKce7VnksGwvx2vpT5DPXd4fmo/QEAPpsP5oxzGcV
	j6uD6tIxg5srHa3+ESHUo7Ssc/vFZuKVsIaAclAmMsructf5e+OGHoSfxNIc5Q4JUtXLT0fnn6c
	qtrYxfswQkoCKnzCyaUNx66/aKfcdV+N8W5YVMadknEUYXFkNK0n989qVdQ4QymILpzt96Sud0P
	QsJVIJdCkRu9YvzS0VQw51/vAavK8v2JhtZ6VwEhivrBTD0iX4087MXhUGkisiR2xx05Q48fpg8
	bRnTxwjvmEBn78d9iXC3dV1mXn
X-Received: by 2002:a05:7022:fe09:b0:144:eb46:be0 with SMTP id
 a92af1059eb24-14d31c6d959mr7036975c88.13.1790876735713; Thu, 01 Oct 2026
 10:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001143040.28467-1-parri.andrea@gmail.com>
In-Reply-To: <20261001143040.28467-1-parri.andrea@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 1 Oct 2026 10:45:22 -0700
X-Gm-Features: AclHuK_PRj6kNhTkNAge75mh0uRy0R-jClYZQl-fhXQ_Zc5OUMVS0wPKh2mqOHc
Message-ID: <CAAVpQUCPBAoofDeDMdQii=5P6FyRnKOdN932fTuocHtb4H+m1g@mail.gmail.com>
Subject: Re: [PATCH net v2] rtnetlink: wait for RCU readers in rtnl_link_unregister()
To: Andrea Parri <parri.andrea@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 7:30=E2=80=AFAM Andrea Parri <parri.andrea@gmail.com=
> wrote:
>
> rtnl_link_ops_get() finds ops on link_ops under rcu_read_lock() and only
> then takes ops->srcu. rtnl_link_unregister() unlinks ops, then calls
> synchronize_srcu() and cleanup_srcu_struct() without first waiting for
> RCU readers. A reader that found ops before list_del_rcu() and has not ye=
t
> taken ops->srcu is not waited for.
>
> Such a reader then locks a cleaned-up srcu_struct and keeps using ops
> after the module that owns it is gone. rtnl_newlink() and
> rtnl_dump_ifinfo() both look up ops without RTNL, the latter for any
> user that dumps links filtered by kind.
>
> With delays added between the lookup and srcu_read_lock() in
> rtnl_link_ops_get(), and before rtnl_link_ops_put() in
> rtnl_dump_ifinfo(), running "ip link show type dummy" alongside
> "rmmod dummy" on a KASAN kernel gives:
>
>   BUG: KASAN: vmalloc-out-of-bounds in __srcu_read_unlock+0x57/0x70
>   Read of size 8 at addr ffffffffc02ff318 by task ip/147
>   Call Trace:
>    __srcu_read_unlock+0x57/0x70
>    rtnl_dump_ifinfo.cold+0x30/0x3b
>    rtnl_dumpit+0x7a/0x1b0
>    netlink_dump+0x486/0x11b0
>    __netlink_dump_start+0x661/0x910
>    rtnetlink_rcv_msg+0x611/0x9e0
>    netlink_rcv_skb+0x126/0x380
>    netlink_unicast+0x605/0x830
>    netlink_sendmsg+0x6d0/0xbb0
>    __sys_sendto+0x335/0x3a0
>
> Call synchronize_rcu() before synchronize_srcu(), as
> rtnl_af_unregister() already does. This should be enough because
> rtnl_link_ops_get() is the only RCU walker of link_ops, and it takes
> ops->srcu before rcu_read_unlock(), so every reader that found ops is
> covered by synchronize_srcu() once the RCU grace period ends. The extra
> grace period only costs time at module unload.
>
> Readers and the writer were serialized by RTNL until link_ops got its
> own mutex, which is why the missing RCU wait did not matter before.
>
> Fixes: 6b57ff21a310 ("rtnetlink: Protect link_ops by mutex.")
> Cc: stable@vger.kernel.org
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> Assisted-by: LLM
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks
