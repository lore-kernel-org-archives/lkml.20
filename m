Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3078374E41
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789146356; cv=none; b=smnk0ohEZsRVzWlMihvqZQtnwUJeeA/fnRf6aAA2DwTFX7SVhQP0SxtNt60g/Rpl1dvJqhrq7bNNWmLa3ZXIqJAZ1dZ+qlh993213QxpD+gQC/ZbTDgi2Wr6zkG36TGkS04fMBTg/aL7Gwu8f0o09kr0uE2Pvf2SpUyvAhz1SQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789146356; c=relaxed/simple;
	bh=+R3ivebSuZpuL4FG2TRYxlXWK7mPI4IWQ3Tpoi4odgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eRwIsViHIEfNQ+2IuNju1WeggJcppEO5NLrHNOdtnMY+/uYbpONbcaAMfwNktnEssVORVj6lAnnuILU4+1iJEjPZIWfjaWSgVJXPLYsoLucp47YJaFwuzXT4flnvV0okW1iwFcKKH1LNTJC7jBmIzVC/vsz5MQOqaEJwQQuM+TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fjx40xKA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lmq9PvPz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fjx40xKA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lmq9PvPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789146352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8gSh+I98IpYLSh7UCgpWIS2EiiNfz/lZyRXhuHswHY4=;
	b=Fjx40xKAq7OiAk3s3jiALagd2/9bzgoFAxmDjkZXdM9l+AuJS2EeKL6dOblBnQL3tPTXXH
	BujsrY47w6bgxKXsmB4MDEf/yD39JwC76GptXkfLZs5CLVb4tSF6vV81P5qJlyygQt/VGn
	AqMB+fUp4q2bylyTqJOhaEKmYdP98qI=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-sqEWpNVQOKigL0wEIxEw9Q-1; Fri, 11 Sep 2026 13:05:51 -0400
X-MC-Unique: sqEWpNVQOKigL0wEIxEw9Q-1
X-Mimecast-MFC-AGG-ID: sqEWpNVQOKigL0wEIxEw9Q_1789146350
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-456ab1a7f2cso1662810fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789146350; x=1789751150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gSh+I98IpYLSh7UCgpWIS2EiiNfz/lZyRXhuHswHY4=;
        b=Lmq9PvPzegrKxT3AgOZWPlHzniB++kVrzpmwac5TloA0LA3ZGefW/mZMobEN6oS7EU
         tfHWH1cNMDpzjNj490LIiCU9bCK9uuceEM/d15i08OH90EBwxXnri8pegBQfglAaoggT
         2ZWvHjIvwfa8kLv2e1MVVuyVAtt82BKVIo9H4LrYp6rPKys7VHhiSwnFXgWAmXVGTIlG
         BpYPKK+PyYSmbnnY6GSPEkh93IVIJgyAR6SFjeLToaxNPTfrc9JBItUP2PNb2YKtmcvR
         G6DcvPC1AdbfB2xF4Tw03RZBDakodASW+cqC+sk9Q+wUfX4s/D+JCVP1RLtbDnkv8NX8
         UDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789146350; x=1789751150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8gSh+I98IpYLSh7UCgpWIS2EiiNfz/lZyRXhuHswHY4=;
        b=RDXgutEiKn2dvegx4ynjKM7iZKs4sCtIVNqss5CRtC6bHokZRHR3qk3GKeVV42epM9
         VAnK5achjQfut0qHpkz91L3sWei0jQ3kWuMT63L00QxHY3BVUsiA3wv0h9IOHNNvpK0G
         7XEbEr7LFO5tQMCKKTtdGii2boasr1dlBWPj/3Wrm2itHJs6jGRDeFSHIAH/fc7iKfji
         7VMxHa+pl1V/gLLYpLuDt3DHXJXL7kAfYlJtavTWnFt3rEV8sckHdjywxhjwF0qaGxIB
         eDFZrD/8R1arR78t9WssihXjYSM/vL+EJgde0WQ023KwEiTYn/rAU9AmHHBIUyTrdPi+
         LccA==
X-Forwarded-Encrypted: i=1; AKwUvBy1iZGGSmIDnKO/IVLSE6LfKjOUjnQUaIueDkmc5p/1ixrYd48pttb8n7XaUyMYMFFWc88dvTs7384vK74=@vger.kernel.org
X-Gm-Message-State: AFuF++nqYpxVLBxuvTZF+z04tJdLeR89vscUccHlYPNFIUA/CmJsvvPB
	hPI/h/GH45EPOmZEUDQp8V+mNCyQwmo0sxeEuQX+mN/euRQPDuitaCCFInWZ/hdMvt9b53H/Trv
	7JLTXMAfdVNniCRUd1kuSNUzMLGk/sY83BtuKCizY4JNAYS1bmTdAfL/kGY7If9wN034rKhffD4
	AF
X-Gm-Gg: AYBFou2QZAxcFyD80cWJ2WHLOLrJ6e1WgQMJInUZRG47SpmyP75id+mKzvdbOZ+/+vO
	IL+mIvY4SzqsiiOwttYpZvyJcPmJ5rpSBxrO7Znn/hrfykb1nlIPQ16KKnkb6FigkZBc5+HhVxq
	DWDQqNfCQ+t2nnlztXnQp+JVFZ8kcTUf2Ys10NvxySxymMQ6RsLiLY9d8+X+6xpZYXBdXX5F8pb
	gCmcUWHVzd/hh/WX/Bw4kMoiyFLm5xWsuotSUyTK6g0MTls6cdXhPyu61PlGannXYTiqxw87kHl
	RfSxe4lgJAW+xO8QdYaQPUnoiiZ2nOn5hGxrW3yCoj7P0DHYmbyl5Bb0n0AWlCX8hKnxGpEeLeU
	nJ10caZEgSE/iZ5FB0bugQrtmks643PfYrme2f5cDkaLwsNK2wTC+vJOx4tapBmJonQ==
X-Received: by 2002:a05:6871:e718:b0:475:e235:8f7 with SMTP id 586e51a60fabf-47de9c84293mr3947484fac.21.1789146350481;
        Fri, 11 Sep 2026 10:05:50 -0700 (PDT)
X-Received: by 2002:a05:6214:d4f:b0:912:ca8:278b with SMTP id 6a1803df08f44-91211fa9bc3mr66903086d6.0.1789146037347;
        Fri, 11 Sep 2026 10:00:37 -0700 (PDT)
Received: from bearskin.sorenson.redhat.com.com (c-98-227-24-213.hsd1.il.comcast.net. [98.227.24.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d0700sm25450326d6.38.2026.09.11.10.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:00:36 -0700 (PDT)
From: Frank Sorenson <sorenson@redhat.com>
To: Zihan Xi <zihanx@nebusec.ai>
Cc: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Pavel Shilovsky <pshilovsky@samba.org>,
	Aurelien Aptel <aaptel@suse.com>,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] smb: client: fix create context out-of-bounds reads
Date: Fri, 11 Sep 2026 12:00:29 -0500
Message-ID: <20260911170034.1236993-1-sorenson@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904140527.62354-1-zihanx@nebusec.ai>
References: <cover.1788516372.git.zihanx@nebusec.ai> <20260904140527.62354-1-zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Sep 04, 2026 at 02:05:17PM +0000, Zihan Xi wrote:
> smb2_parse_contexts() validates the complete create-context area but does
> not bound each context record by its Next field before dispatching to a
> handler.  A malformed chain can therefore expose bytes past one context to
> the handler.  The QFid handler also used a full response-structure cast even
> though it only consumes DiskFileId.

Hello,

I have some thoughts/comments on your series.

First, a possible reason for not getting a response on your v2, and
delayed response on this v3: Steve French passed away in August, so
mail addressed to him isn't reaching a maintaner, and things may
have gotten missed during transitions.  You'll want to send future
versions to Paulo Alcantara <pc@manguebit.org>, with Cc to
Namjae Jeon <linkinjeon@kernel.org>


I've been carrying an overlapping patch (an earlier posting:
https://lore.kernel.org/r/20260826153147.4112943-12-sorenson@redhat.com).
in a bounds-checking series of my own.  Like yours, my patch has
been addressing the memory safety problem in the three handlers
which read at fixed offsets, rather than the generic checks.

But I think yours is probably a better fix, and you've got the
PoC, so if we can perfect yours and get it in, I'll be dropping
mine in favor of this series.


A few points (take with a grain of salt):

1) The lease parser still reads at a fixed offset rather than from
   DataOffset:

>  		case 4:
>  			if (!strncmp(name, SMB2_CREATE_REQUEST_LEASE, 4)) {
> -				*oplock = server->ops->parse_lease_buf(cc, epoch,
> +				if (cc_len >= smb2_create_lease_min_cc_len(server))
> +					*oplock = server->ops->parse_lease_buf(cc, epoch,
>  								       lease_key);

cc_len bounds the record, so the read stays in bounds.  But this is
just like the QFid bug you just fixed nearby:  smb2_parse_lease_buf()
and smb3_parse_lease_buf() reach the fields at the canonical offset
of the create_lease layout, not at DataOffset, so a valid but non-
canonical DataOffset could get in-bounds garbage rather than an
OOB.  That's not a security fix, but since LeaseState drives client
caching decisions, it's probably worth closing.  Reading lcontext
from DataOffset, as with DiskFileId would make the two handlers
consistent.

(My version also had this, so it's more an observation than anything
else)


2) You may want to consider matching DataLength exactly, rather than
   taking a minimum.

ksmbd's parse_lease_state() requires:

	sizeof(struct lease_context_v2) == le32_to_cpu(cc->DataLength)

and validates DataOffset + DataLength against the create_lease_v2
size, rather than accepting anything at least long enough.  It was
suggested to me that having the client & server halves agree on
strictness would be good.

(I did confirm your minimums cover all the fields each of the parsers
actually touch, so this is about strictness, not a hole)


Frank
--
Frank Sorenson
sorenson@redhat.com
Principal Software Maintenance Engineer, filesystems
Red Hat

