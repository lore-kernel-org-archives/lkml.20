Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D824248BB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770850; cv=none; b=JAcPPDbYWLak20V+wIlejQoDncVw/MJJBsvsEZuoL0dYZkaU76DNLNWyS4YECVp/rtsFVBqiCo1jF86XeXDMg7zTEIOCcQ/D75lXLItWI8vgIrcOyGLTqxm8BEdIMcZv6a4Nqk5Jagj9QKK1U6g19Z5Ne9xVi7Tc0/EnVe2JB30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770850; c=relaxed/simple;
	bh=uAdR7AJefg7XJMmJnGVxreLMfgxg4l7CIv5IiLGe2q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WEfbt4zoiJoNDB7/nG5hkMYyuyWtunBzL3VZxXm7nFuqCaaBhwaKClPHf35Buj5XcwEBPs5XY9f3eQmc+6cLcFPS+i6gfkS8B/P5BkHn4I+P97IE9egG7MlfNW7vFjCvgluFpcgwN+raBSFCbQ+nSlDG8L8KpWJXqfo58kKvNdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=gN4zDSqJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="gN4zDSqJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso41808055e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1788770846; x=1789375646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BrZfINTX7sxI4mWYRCn7cilENkHFd4AeCmaM2CD2NQQ=;
        b=gN4zDSqJfqNJ2rlAp+g8bqrY9gKMWctoYH/ulGWJ2NswUdpmqk72L0zUlc9n5vOdlO
         O6QeMflNZnrBEa+In8M7xTMFrY1eY1UuUiJ3w6xODJEHkY5OrqNsnlzwCYkwwtlYdhyF
         pAPfzEyAAinJB2qY4bSeRiuANUbuBsSTVDBYF9dHIvd8BWote14LvILLJJqjAhGuBk+d
         2jJJ4eOBaYsDlfYRX+nNQeQFn7oMcjGj4agYYMPUc4wRnMQhtSREPMUMy3PK2uaD0rv5
         jYZhIGbMzwfecHdNOYP6PbuNMADzJOzYoJySZEFCC7qajq0NWgWoOxRclKXQV/oyy1i9
         uS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770846; x=1789375646;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BrZfINTX7sxI4mWYRCn7cilENkHFd4AeCmaM2CD2NQQ=;
        b=FFM2qOpuOp2ENa3+FMBlmWv0S/WuplearOqC7+jroF9HiQcyT3MfAVXjsoC7sfykLF
         5K8qzTnc3Z7zpqCWJq7J9qCFi0kD/m7567X4qKE6cK9NYdiQYNL+dYYshhsaD17G6KYz
         16jWAbBx5aGuhxXelGAkriS1ieWEwb26cyAKW1zsFAoZ2gfidldlrsitvnBPc2qiEcxt
         OFeiiStBpTV5gpJzn+On8GFNrPNFv+UQOItfbFU182drzV4KRZynn5xdULAzI8NfEMr/
         ncTFcu1P//zbz0wAPwSxRG/hT/wG0EWfxdQmLmwa09JX/ugyP6uh0tGjLsKUETqtSGt0
         sEwA==
X-Forwarded-Encrypted: i=1; AKwUvBzB28WduSn/kQjNIEGOYgj8+cks+6Sg0SKwBtLCcTA2xZhwI8i9a2qyoyvzi/YpCk1DVN335rK1GvOGCEY=@vger.kernel.org
X-Gm-Message-State: AFuF++m9kMyrgP15cbaW3sPtcSKqdn1xI4vFrM2NFQv7uaQ1NFfh+Pjb
	YjtP2TyFLp0gFvi7XmL8E46qD/jKoHOXeAnrc31pNMt/7T94FRm7N3XdifXf9/oHlCI=
X-Gm-Gg: AYBFou2GIqeBn9qzmVH0nOceZuDUnPtyD85lGinteAYWkEiG+oPCov1GEJ4WqaeqmXT
	K0o4BJBfXh3nzAcByxluCl0QyMlNZd8Om3GGWgjbF7Z+CUZ5KC0psFBYXKyi20FasWsCRXfai3m
	UC3cozO8RDswneeQC6xiDgG1slAHvKdzyab9iJskgBJP0Fl66FBpuSaBq3gAmM2aJwUMcwiwzTF
	YHbQXoDbcd6onC8MWARk68ImKdaOCGD7GNNQJGsGplhgNHmOrn+givlwnv7DWQ0QZeLEjZiN37d
	iF2SqEeDGG3wXUHu056XqwHbCevpKTGWNLkpzoQr1vzHHoj76HelX4r3rwXFpGvbUCDmkXCfrao
	cBc7Cl2orkr9YQ1ZCgRGVi7rLK2ri8zTFxAdJQw2eoYaclgIBqfcWNjkGyoI2/DC5X4PNeozUtQ
	sYXSyh/dEclgAksmAhm/d/zFLC4PwP9pdfgAnHr4fxgEXrAxCqovq8iYVwEU3/ig84969WuUGMl
	1YQ6ziav7d2s9GN1sg=
X-Received: by 2002:a05:600d:8481:20b0:49c:fde6:8b39 with SMTP id 5b1f17b1804b1-49cfde68bacmr126832555e9.29.1788770846306;
        Mon, 07 Sep 2026 01:47:26 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm400041515e9.5.2026.09.07.01.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:47:25 -0700 (PDT)
Message-ID: <ba2dcdb6-923d-4fc1-9c92-7a77c0b61a09@blackwall.org>
Date: Mon, 7 Sep 2026 11:47:24 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: bridge: bound the port VLAN lists in the
 IFLA_AF_SPEC nest
Content-Language: en-US, bg
To: Artem Lytkin <iprintercanon@gmail.com>, netdev@vger.kernel.org
Cc: bridge@lists.linux.dev, idosch@nvidia.com, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, davem@davemloft.net,
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260906224246.21719-1-iprintercanon@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260906224246.21719-1-iprintercanon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2026 01:42, Artem Lytkin wrote:
> br_fill_ifinfo() opens one IFLA_AF_SPEC nest, fills it with the VLAN
> information of a bridge port and closes it with nla_nest_end(), which
> stores the accumulated length into nla_len. That field is a u16, so for
> a nest larger than 65535 bytes the stored length wraps modulo 65536.
> The encoding has never been able to describe more than that; nothing
> regressed.
> 
> Three per-VLAN lists share the one nest. An IFLA_BRIDGE_VLAN_INFO costs
> 8 bytes, an IFLA_BRIDGE_VLAN_TUNNEL_INFO 28 and an IFLA_BRIDGE_MST_ENTRY
> 20, on every architecture. A port takes at most 4094 VLANs, so the VLAN
> list alone is at most 32752 bytes, but the other two reach 65535: 2341
> tunnel mappings that are not consecutive in both VID and tunnel id, or
> 1821 with uncompressed VLAN information requested alongside, or 3277
> distinct MSTIs. A VXLAN leaf switch with one VXLAN device maps thousands
> of VLANs to VNIs, and "bridge vlan tunnelshow" and "bridge mst show"
> read these lists through the link dump.
> 
> Nothing fails on the way there. br_get_link_af_size_filtered() accounts
> for all three lists and feeds both rtnl_calcit() for RTM_GETLINK dumps
> and nlmsg_new() in br_info_notify(), so the skb is large enough and no
> nla_put() fails. Userspace then walks the message with RTA_NEXT(),
> which advances by the stored length, so parsing resumes inside VLAN
> payload and everything after the nest is read out of it. A
> CONFIG_DEBUG_NET kernel warns once, in nla_nest_end(), via the check
> added in commit ff205bf8c554 ("netlink: add one debug check in
> nla_nest_end()").
> 
> Measured on a port with 4093 VLAN to VNI mappings: the RTM_GETLINK reply
> for the port is 147776 bytes and carries an IFLA_AF_SPEC nla_len of
> 16280, and the top level attribute walk derails 16672 bytes in. The
> notification path is worse, because it broadcasts. A port flag change
> goes through br_ifinfo_notify(), which asks for compressed VLAN
> information, and the resulting RTM_NEWLINK is 115048 bytes with an
> nla_len of 49088; walking it yields 2342 attributes after the nest,
> 2341 of them read as IFLA_IFNAME, since IFLA_BRIDGE_VLAN_TUNNEL_INFO and
> IFLA_BRIDGE_VLAN_TUNNEL_FLAGS carry the same numeric type. Every
> RTNLGRP_LINK listener in the netns receives that. The DEBUG_NET warning
> fired from br_fill_ifinfo() while the mappings were being added, in the
> context of the process adding them, since each addition notifies too.
> 
> Bound the three lists by length: stop adding entries once the next one
> would not fit in 65535 bytes, counted from the start of the nest so that
> the lists and the inner IFLA_BRIDGE_MST nest share the budget, and
> charge a range at its real cost of one or two entries. This is what
> commit bdd39576bf50a ("net: bridge: prevent too big nested attributes
> in br_fill_linkxstats()") did for the sibling nest in this file. A fixed
> cap on the number of entries, as IFLA_VFINFO_LIST got in
> commit 51e15308c6ae ("rtnetlink: cap IFLA_VFINFO_LIST at a documented
> number of VFs"), does not fit here: the lists share one nest, 4094 VLAN
> entries take half of it and 2340 tunnel entries fill it, so any set of
> per-list caps that is safe in the worst case cuts configurations that
> are described correctly today. The byte budget regresses none of them,
> and it is still a limit userspace can compute, since the per-entry
> costs are fixed. Documentation/networking/bridge.rst states them, along
> with the RTM_GETVLAN interface that does not have this limit.
> 
> The MRP and CFM lists that br_fill_ifinfo() emits for the bridge device
> itself are not touched. They live in the same nest but never next to
> the port lists, and CFM peer status can grow past the limit on its own;
> that is a separate change.
> 
> br_get_link_af_size_filtered() clamps the three lists to the same 65535
> bytes, so a dump of such a port no longer sizes the skb at 147 KB for a
> nest that holds 64 KB, and br_info_notify() no longer makes an
> oversized GFP_ATOMIC allocation from STP timer context for a message
> that would be truncated anyway. The clamp cannot cut into the MRP and
> CFM information: for the bridge device the VLAN list is the only one of
> the three and stays under 33 KB.
> 
> With the bound, the same port dumps as 65932 bytes with an nla_len of
> 65508, the notification is 65936 bytes with 65512, both walk to the
> end, and nothing warns. A port above the bound reports shortened lists,
> so "bridge vlan tunnelshow" and "bridge mst show" print the first
> entries and stop instead of printing garbage, and the rest of the
> message parses. Read such a port with RTM_GETVLAN, which gives each
> entry its own attribute and continues in a new message once one fills
> up.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
> ---
>   Documentation/networking/bridge.rst | 17 ++++++++++
>   net/bridge/br_mst.c                 | 12 +++----
>   net/bridge/br_netlink.c             | 49 ++++++++++++++++++++++++-----
>   net/bridge/br_netlink_tunnel.c      | 20 ++++++++++--
>   net/bridge/br_private.h             | 23 ++++++++++++--
>   net/bridge/br_private_tunnel.h      |  2 +-
>   6 files changed, 104 insertions(+), 19 deletions(-)
> 

So much crap in a single patch, my eyes hurt... Yes, we know about this problem
and it is obvious to anyone who can count. This is not the right way to fix it,
it should probably be considered a corner case but still - IMO silently truncating
is very bad. I prefer a more explicit path - return error for both (RTM_GETLINK and notifications)
you'll have to plumb down extack but then user-space will know there are too many objects or lost
RTNL_LINK notifications and it should resync (e.g. use RTM_GETVLAN to dump the vlans if needed).

Cheers,
  Nik

    


