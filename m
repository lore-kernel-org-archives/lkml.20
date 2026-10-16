Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97EA582BA0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176025; cv=none; b=IdP06rf4vkIG5RGkO3ZS10OAsUTGnNRdAsjCVj9BovupP6UZAc0kU0OmkGqaMEsWiu3t3+fH/se5EETtNuWXhePjbeI0j09G4dj+7w6FFUaVhrk3wdwnSwpJRkTHWwVLMtwYA/LlVcEJDJLkbf+kOoFWx9ObSdu+QI8IXxusQIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176025; c=relaxed/simple;
	bh=TtCwQmW9z7VLSlbkIUYvUJ6XV+W61FfizwGxp/7PXxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShS4xftDEVkjpE/L5KifKa124D9w6GtVt8Ke2wo/g/G0pk4MFbjXowJjr8ONQHUwg7nGyPEuZS3SH2dYq0bYaJu9KQYvoaRFjn2XKhIfDFRY5MyczMI6jyw/EY/oMswdCt1zD1rlXwZ5q+Pkf6TOw1Orp7dVp7g06lpkZuZW4MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jgi5GBvY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bC6qo3gx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jgi5GBvY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bC6qo3gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792176022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=plc50fRCIOdcKHDZ5D5nq9FAVnLtqLtSVPaltfZbIaM=;
	b=Jgi5GBvYsQXsu74SyEm762bnDQhEWKEDCE5Cdgqp0gqOEziTEqAU9tQNGA/5s9Rr6x21nI
	hYMESgbGy0ISsOlzOcP1w7JEWozKSHb5FuE0/p+YrJJNicNyhDJ1BbHHFsbH5Tq5wazak+
	lleaxgHmMMht2mOEUS90FouOXmgWVOg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-g3GDH9GXMNKGF5NmGZpv7g-1; Fri, 16 Oct 2026 18:40:20 +0000
X-MC-Unique: g3GDH9GXMNKGF5NmGZpv7g-1
X-Mimecast-MFC-AGG-ID: g3GDH9GXMNKGF5NmGZpv7g_1792176019
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c7fe9736eso90538f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792176019; x=1792780819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=plc50fRCIOdcKHDZ5D5nq9FAVnLtqLtSVPaltfZbIaM=;
        b=bC6qo3gxeQgiJZ8bkrTygAfW6HXrIZ1k7LJyh8TLXObK7HAQJYHT4pJKSLH6tOGssc
         QY14v5ilGa9TJIMATsH3gf5kS/6e2BBoxixSYRRFE/mt5xtr8wt2+c/4UWq498TH0dsk
         M9Q8Dv8jsObX8cJtNzNXau/+oT9mxbRW/kopvp7X3mHFWWFoqUYSBFafJhG8yTYQnrhW
         rZdD8hkKntgkdCLVIF88pTCDW8symjjPcVxzdWd+3plGnD0nRLgnC1y06fSLGEO/CeUZ
         5qccn7MUq0nTNMQT7M7TUpFzrwwp/H3Wi3bwQCmLvgbjWbfnP99O9cLFUtYKFWVXPeuG
         sX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792176019; x=1792780819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plc50fRCIOdcKHDZ5D5nq9FAVnLtqLtSVPaltfZbIaM=;
        b=Plsd5Thcpxfhq8vkyky8yZgdq6423nn+P0hhjQdz8rUwlOF1e5Yhr+nhkn95wmFD9w
         CJEphWRjPCh+9GKd52+HOdBGrjBeJ73dxLk0DPfK+ofMHCKpT7cxQ3w3CRCuQuHnf07G
         2c/hs+CyyMztbADUzwBemCz40b6zVT3MI1ZdFC4nGapD8yJIEDs+TTTse24h8zqHI+4u
         xznHVG6KfO9D9rlFTVBooqchX05UfkgIGxPKvN26JQ3T1PB7Nos+u2X0U0sYbQmW7o45
         vE9Bdz6OjyLn0rH77VsQ8ZgqOq96oOLW15VingZzCQYF3Yv73r2TR2v297sg8Ai5X3Z3
         UDtw==
X-Gm-Message-State: AFq9FYKjw7wUVtllFFwB1gQaHjhJNEfNSGB1j1U0rYH5Pqmftso69H5O
	c54L6Zz7IGTBT5czx6ln3uCPpYpMsFysyV5Y8NK3qekp+KYMpoNsIXjbKjtpl3LItZ6WuiL1gpN
	cG9FV36l1LAwYTpVLbPAzaIp1mtfwRHJsKfqL4wEt8lvraGNAiNprPi0RPryTzSZobg==
X-Gm-Gg: AYBFou2XtSrXBvavRMEgEQOo1LUuO0anG5oH3ebrDINFz9IGC2h8qhSUswmWN7Iwj4F
	7bcy8TrpggK/PNPcoUnzmxIiQj3MMpRzQCuVvadgCCqKGnf5mAou0x7kukOJDELLYFlE4CxRsfi
	ZEQk/tuGoHBzqoGU8XXku/Z9XX3HFwPB0MvXbQVxIghc1mJDfVOCqUfnTWh8dxdBTJhB+VH1aca
	JAnrv/NpYJZSNVGek607KHOhj/wVZrTKwsFexZ3+b6mT/sji1w38DZRqXC6QNS07sI5Pfy/ChyU
	hrFbeh+d8glQCYXhCKPPy23PJTZ033OjQpoQNO2fBYT/Nnh3SF4n2uCYsZcOAVkm09QXuec=
X-Received: by 2002:a05:600c:3e85:b0:4a1:d798:b08a with SMTP id 5b1f17b1804b1-4a1d798b0d4mr12241565e9.21.1792176019012;
        Fri, 16 Oct 2026 11:40:19 -0700 (PDT)
X-Received: by 2002:a05:600c:3e85:b0:4a1:d798:b08a with SMTP id 5b1f17b1804b1-4a1d798b0d4mr12240665e9.21.1792176018224;
        Fri, 16 Oct 2026 11:40:18 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73fb:d100:601d:d7d4:d03f:527b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cc642573sm56208515e9.2.2026.10.16.11.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:40:16 -0700 (PDT)
Date: Fri, 16 Oct 2026 14:40:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v2 5/7] net: add a sysctl to opt out of virtio
 net hdr checksum validation
Message-ID: <20261016143944-mutt-send-email-mst@kernel.org>
References: <cover.1792067836.git.mst@redhat.com>
 <ad05a40681719a579691a1da6413f0dd7064f2a0.1792067836.git.mst@redhat.com>
 <willemdebruijn.kernel.3a7d04e1c306e@gmail.com>
 <20261016051827-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.1d7ce6b64753a@gmail.com>
 <20261016134823-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.2deaddfb31bd9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.2deaddfb31bd9@gmail.com>

On Fri, Oct 16, 2026 at 02:19:39PM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > On Fri, Oct 16, 2026 at 11:30:17AM -0400, Willem de Bruijn wrote:
> > > Michael S. Tsirkin wrote:
> > > > On Thu, Oct 15, 2026 at 01:50:54PM -0400, Willem de Bruijn wrote:
> > > > > Michael S. Tsirkin wrote:
> > > > > > The ingress validation as implemented by the previous
> > > > > > patch is stricter than what it replaced: GSO
> > > > > > packets whose checksum metadata matches no transport header are
> > > > > > dropped, and non-GSO ones get their checksum completed in place.
> > > > > > Such packets used to pass with the metadata unvalidated,
> > > > > > and with no overhead.
> > > > > > 
> > > > > > I judge that this should not affect any deployments, but there is still
> > > > > > some risk that it does.  In case a deployment depends on them anyway,
> > > > > > provide a per-netns switch to get the old behavior back:
> > > > > > 
> > > > > > echo 0 > /proc/sys/net/core/virtio_net_hdr_csum_check
> > > > > > 
> > > > > > The default is validating.
> > > > > > 
> > > > > > Assisted-by: LLM
> > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > > ---
> > > > > >  Documentation/admin-guide/sysctl/net.rst | 15 +++++++
> > > > > >  include/linux/virtio_net.h               | 23 ++++++++++
> > > > > >  include/net/netns/core.h                 |  1 +
> > > > > >  net/core/dev.c                           |  6 +++
> > > > > >  net/core/net_namespace.c                 |  1 +
> > > > > >  net/core/sysctl_net_core.c               | 54 ++++++++++++++++++++++++
> > > > > >  6 files changed, 100 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > > > > > index e586e17fc7a5..7f230929c37e 100644
> > > > > > --- a/Documentation/admin-guide/sysctl/net.rst
> > > > > > +++ b/Documentation/admin-guide/sysctl/net.rst
> > > > > > @@ -246,6 +246,21 @@ processes are dropped unless socket option SOF_TIMESTAMPING_OPT_TSONLY is set.
> > > > > >  Default: 1 (on)
> > > > > >  
> > > > > >  
> > > > > > +virtio_net_hdr_csum_check
> > > > > > +-------------------------
> > > > > 
> > > > > Make more generic, virtio_net_hdr_validate?
> > > > > 
> > > > > In case we add more validation in the future (as we have in the past),
> > > > > without having to introduce multiple such knobs.
> > > > 
> > > > But it's uapi, are you sure we'll be able to change the meaning
> > > > of an existing knob, even if we keep the name vague?
> > > > 
> > > > > > +
> > > > > > +When processing packets with a virtio net header (through tun, tap, a
> > > > > > +packet socket or a virtio network device) that request checksum offload
> > > > > > +(VIRTIO_NET_HDR_F_NEEDS_CSUM), validate the packet: complete the checksum
> > > > > > +in software, or drop the packet where the header does not match it.
> > > > > > +
> > > > > > +When disabled, the header is trusted not to corrupt the packet, and the
> > > > > > +checksum is offloaded to hardware (or not verified if it never reaches
> > > > > > +hardware). This is only safe if no protocol is processing the packets.
> > > > > > +
> > > > > > +Default: 1 (on)
> > > > > > +
> > > > > > +
> > > > > >  wmem_default
> > > > > >  ------------
> > > > > >  
> > > > > > diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> > > > > > index 357115ff0ec2..aa2f8ac4657c 100644
> > > > > > --- a/include/linux/virtio_net.h
> > > > > > +++ b/include/linux/virtio_net.h
> > > > > > @@ -5,6 +5,7 @@
> > > > > >  #include <linux/if_vlan.h>
> > > > > >  #include <linux/ip.h>
> > > > > >  #include <linux/ipv6.h>
> > > > > > +#include <linux/jump_label.h>
> > > > > >  #include <linux/netdevice.h>
> > > > > >  #include <linux/udp.h>
> > > > > >  #include <net/gso.h>
> > > > > > @@ -78,6 +79,19 @@ static inline struct iphdr *virtio_net_ip4_parse(struct sk_buff *skb,
> > > > > >  	*thoff = nhoff + iph->ihl * sizeof(u32);
> > > > > >  	return iph;
> > > > > >  }
> > > > > > +/* Defined in net/core/dev.c, enabled while any network namespace
> > > > > > + * has net.core.virtio_net_hdr_csum_check set to 0.
> > > > > > + */
> > > > > 
> > > > > Should this be a global sysctl, rather than per netns?
> > > > 
> > > > 
> > > > For customers I work with, it would be much less useful.
> > > 
> > > Third option: make it an integer rather than a boolean.
> > > 
> > > 0: no validation
> > > 1: current level of validation
> > > 2 and beyond: if we have to extend it later
> > > 
> > > Not pretty, I'll admit. So fine to keep as is too if you prefer.
> > > But I do foresee more changes in this area, if history is a guide.
> > >  
> > > > 
> > > > > Even if per-netns, most likely do not want it writable by netns root
> > > > > with user namespaces.
> > > > >
> > > > > That is the equivalent of ns_capable(CAP_NET_RAW), which is the cause
> > > > > of many crashes due to bad packets ingested by, e.g., a packet socket.
> > > > 
> > > > Hmm, yes i get that. Two knobs? a. verify b. the per netns value ro? Both
> > > > on by default?
> > > 
> > > A single system wide field is simplest.
> > > 
> > > Is there a benefit to making this configurable on a per netns basis?
> > 
> > As I tried to explain: a specific container breaks, you decide to trust it,
> > you do not need to trust all.
> 
> Ok
> 
> > > If so, that's fine too. As long as root-in-namespace cannot modify it,
> > > so readonly indeed.
> > 
> > 
> > Right. So I envision along the lines of:
> > 
> > net.core.virtio_net_hdr_validate_all - validate packets from any netns,
> > netns root can not change it, only host root
> > 
> > net.core.virtio_net_hdr_validate - per netns
> 
> Then skip the global option, as it's just a convenience: the same can be
> achieved by iterating over all the per-netns settings.
> 
> Per netns validation, but only settable by root, not by root-in-namespace.

Hmm I don't know how to achieve that. Are there examples of such
options?

