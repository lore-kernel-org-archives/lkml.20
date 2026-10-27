Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099881;
	b=R9r9R/qqX2/eHi05m+DYdC2VMcH21ABdD+yOvP63Rm65wtLt6gdRCDznB9hJlCgeNsC5
	 IzmJUrYHojw1IcpEzSR+lUCui67SqKMc8GAY+u8r+Ppmci8p8AS5EWIJ8w/GIRa60lXk/
	 4DVPljLgw0mXvilvHXkshCnIu+i20G4wU0ZR+yMagts1Z3uxg1E2DGhi5C37HBrKoDucG
	 ts5fx4ZxdmWk+CfwUicXapRy8cAtpoAjvczJ2xGDMh5H+BSx8HhXSXPbAV90ojRGD2k/L
	 Lp8sEI0OcU7gTiYPZK0/WqA5VDX8uHla5kTj/jJf3csrbDz20GW6kfeGuEl5wDRa6ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099881;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=0urO1S2sMMwM1b64Zw173NbbjAiBQHWHM8jZjx0I7VI=;
	b=nFHTmEeS88tLbhxZWXWdjlwUfht4xCsR7foGZ+s/vjWV0ZxKWV2rsXNVYbxZGrHigVtn
	 oMwQRDqY5c3odaQnzDMXp7JrFPmNAh9hb5YZmS62WxmYhPEJgrPK1Bp87FMBQJfPxrcj+
	 N+3DI5pKsPjVNNr2XpHRrTHHRxCP7Ts3XkyGBSirmBktPJGqaI6nhR5vaoBJJgVdpZjLA
	 5aDP5agVZJUKNdrnR6HXtGm8m7BwgRwiDmKVrxQjaBUd6JdYzu/2JopKjWzmEI8jZrwOR
	 97ERGmUMP+y8bFGrVSO/btUNkNt1dMIrt9K28F74CF8QFVlZkTW9o5WH4vIced3B8ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iT7kiGdy;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7980606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7980606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iT7kiGdy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793099879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0urO1S2sMMwM1b64Zw173NbbjAiBQHWHM8jZjx0I7VI=;
	b=iT7kiGdyQJWdhfl55WghpAeigv1YRP/9AE4ivvk2TAeEVMO5wLH8HsaVgHk16vRmff29+0
	+362ShANEjsZC8JsH9IKuzGD9cjFBxkABMdxmBl1z09g/feOwtqLkOU4ZzMiglD+uIDwIB
	+odixqMdXLFd99JEt6DBFqHxNiPNdvs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-374-wTHgKJVoNquQOpTaugwj1g-1; Tue,
 27 Oct 2026 07:17:58 -0400
X-MC-Unique: wTHgKJVoNquQOpTaugwj1g-1
X-Mimecast-MFC-AGG-ID: wTHgKJVoNquQOpTaugwj1g_1793099877
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9E13E1956045;
	Tue, 27 Oct 2026 11:17:56 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 9EB4030000E7;
	Tue, 27 Oct 2026 11:17:54 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Tue, 27 Oct 2026 12:17:56 +0100 (CET)
Date: Tue, 27 Oct 2026 12:17:53 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] signal: fix endless loop in complete_signal() during
 a non-leader exec
Message-ID: <auCIYaAajGGvHEua@redhat.com>
References: <20261027025055.842038-1-nickolai@csail.mit.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027025055.842038-1-nickolai@csail.mit.edu>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 10/26, Nickolai Zeldovich wrote:
>
> The curr_target walk uses next_thread(), which wraps from the last
> thread to ->group_leader on the assumption that the leader is first on
> signal->thread_head. de_thread() makes the exec'ing thread, the last
> one, the leader before release_task() unlinks the old leader, so a walk
> that starts at the old leader stays on the new one if that thread
> blocks the signal, and never gets back to curr_target.

Oops... Nickolai, thanks, let me think about it. Can't work today, I'll
try to write another email tomorrow.

Oleg.

