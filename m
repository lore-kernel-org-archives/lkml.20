Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192191;
	b=XRObKgIQcD9pemLRVPL+YC69XxaMnvqYmECDC45njwzYiVPE1oQMny3KooDRq7LT1KBS
	 YXU/t/Qok5Bf8TyAPMb4TWP8wcbfuyYQsrhVXeno989jlcW89vJogi78zLE96dIiUQMGc
	 hI3GUjY2AOKLsySH0yg4JQvTnKaLPQsCOOXnBY3SYB04HWNmxQlyROvpGk9/+lkwNCmo2
	 rOwgM9xbUQ1SaxcCKTzsIdoUfyW2u1YxOTGADwUg36ZxXKJfNQAlPj3O5VT1s0TVtVSzz
	 ENfLjKdPiqSOj775rAewhqQhNxjgcGWG41LWHLGeKBiWP3fVBmI3FioRQPrv0gSYc5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lbsHrjkpK1cq0QRwZ9oauLF2GZ88NqZOcvz5poLBJyg=;
	b=zPoVe3KbxSeBn8nPmm489C9YN6xzWdF54fKF/uYLs5JnOg3cGPP9GCP3N4RR6NkORyMd
	 rk+MmKswwrA3AyGA5qy7uooWZ3MIBe5qBS8uoWWxF5uXaNrh3YSf9oIR3c8AobxHLW8HX
	 qkrKijKWpwguZzqbXVUw9aDzDVb3XlpfXn0kYzEpsK71uzJtdpQ7qWSj4oPJm69BvVahF
	 7TDtfNcUIctpEN0N5r5b3mCLwGgSiS6kpBkd5Y6GGNo6Ds5m/pAaaOVt/gh4vSeKiZv2c
	 KqmVj2DhbvS6/ln7+a3R1Veus4m+27JS6Nq91FYZTWleawK6oZymbX3sjuJY1LEV7dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=cbxiXzcB;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB63606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB63606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=cbxiXzcB
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91ea2e29d90so5105176d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794192190; x=1794796990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lbsHrjkpK1cq0QRwZ9oauLF2GZ88NqZOcvz5poLBJyg=;
        b=cbxiXzcBq1YTRCRTQ5SpDNs57XNcRCOklDPWlZDn2EVhGusLShQSlRFpqQp4aJNUGm
         TzAfh2JvnGlVH1xt6ca5uwisyuC/guT42PwIC1/gjLSVdqvPdKgHokbMEzSkXZECnaow
         YtJEeG2TMwYHywh6hmjFXAwRDdSRYzQ0of8bg2ZsdIEt1bsu8POrC8NUg4D2mhgXgZ4l
         yXQUA0OxTzasWnvl1UxIkKeBh0N/n5E2tioPhTevlGXrzWO1O9nvB6osZY69KUbUqc7G
         rmCS62U+mF3PyNnfR5iyO1yR01jv3iYytpSMgnr9cMV6Cg1tMhQg68ZstJeLpTW5SMSe
         aHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192190; x=1794796990;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbsHrjkpK1cq0QRwZ9oauLF2GZ88NqZOcvz5poLBJyg=;
        b=vc0sykp9daZR8MtZX1LAYpQGxU/k1AeE4Vo4eAPOvTx5bG0WMDZpCQYCvKZnbHSD1R
         /ZoRRuCleHtjtq/t2O9X9lo+tV3GSyeof7jNWISl/kNv37/TnNjTbugcpAXF6adrZ/h2
         wEwvEJKh3zER5fIMqBMNubodnzyVvp3DJ2RqKcW3myoK9ULdwTWQzXgQVbthNGlek9Bw
         y87/EghwMc0vmDohM9/IJP5aclcQUyYcqSeavJlgkH0H7JN45wnYbJOJokDjloEpPqNz
         A4hFrgkH+dVQsSlRERVK7oQ0x2wEzAC22ce8cOQmEpuO5eFKp+vOGNmAZkdV+J4ay+d2
         FjHw==
X-Forwarded-Encrypted: i=1; AL+hErHVTJOl0b3rUZK2oC4S+lC9RlDkvEMV900wfOW0KGA5zoG22ed2OqtnnPb+a/4Q45FIZceLijnV5L9Jphk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lpAGk3enJCtZ+2tTrx6EjaUF67AVn3q/SqowBEV6Ajng152VP
	AoGfpL6Utk8iuAXIsD4UVs/AijUuSmi3z5qo2s3dUyKZEgmEqgby6Km7ettE67B2DQ==
X-Gm-Gg: AYBFou0+Auex6L1EQwrHCPSwFwJxZioXunKOnaEDysNapIHfFANFExzsWOMAaUSEnD7
	T/l/11pBJLPlH3C7wZ8SbXKbFpllgbxzG7jqn3LkZEa6cgL22O7m9Tq1juW7Z+vxyZhcav+fyIg
	FVzLh4oIoQ1m/z1tQhpt7hwVtB3a6HITJnssmjFOMqgM94VmQqQOOHRg2anNdg/o1cy4auOcUmK
	e4n28yF2C6j/R4zvJXK3HB7AZ9DlrRyaZAZjH9z/d8v3Tx92Pk30j56Z6QRbV9wzzoxRHO3h4mG
	E181QdnZGb+gT2lpeCOQ1C9wglOgBBwfw6AcEyObZ4fzZqOo60b0+9i0R3vldmJVaV422zbayM6
	oLXbwlQhWZ4NB297LQ1GXqo4Jv+b9k6jATLcw4oCgkP9+4AQmFZhzvNVF2jeD6Ra/N7QUJ/+hs2
	gOqtBWJs9gUgC3dgIpmIWd7CiCOyCyNqFSej6NHxxP+kiVa1jSjNkGcr1pL2podkTlC1aHivx2s
	ovtZgDwxE94KjXK+u52q0ywx0Q44ul/y+jEYbSrQf6c0Ct/ajU0OLqBzH4TMUFE9kKOqPf/8J1j
	iAZKstfolb1v7ZZJ/tTGEEiXqnxs
X-Received: by 2002:a05:6214:c4b:b0:91c:8ff2:51ed with SMTP id 6a1803df08f44-91ebd14d862mr87689676d6.2.1794192189470;
        Sun, 08 Nov 2026 18:43:09 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ecee18a77sm32078146d6.26.2026.11.08.18.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:43:08 -0800 (PST)
Date: Sun, 8 Nov 2026 21:43:05 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] usb: gadget: gadgetfs: fix ep0 request lifetime
 and event counter
Message-ID: <071e601f-4a8d-4ff6-bf1f-bae9606ade0d@rowland.harvard.edu>
References: <20261107-b4-gadgetfs-ep0-v4-0-86bdfd684b54@gmail.com>
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
In-Reply-To: <20261107-b4-gadgetfs-ep0-v4-0-86bdfd684b54@gmail.com>

On Sat, Nov 07, 2026 at 09:46:12PM +0900, Jing Lin via B4 Relay wrote:
> gadgetfs_unbind() frees the preallocated ep0 request after disconnecting
> the gadget, assuming that no I/O remains active. With dummy_hcd, a
> delayed userspace response can leave the request queued when it is freed,
> which triggers the warning in dummy_free_request() and a use-after-free
> when dummy_udc_stop() drains the endpoint queue.

That's right; gadget drivers in general are responsible for cancelling 
any outstanding ep0 requests when they unbind, and not submitting any 
new ones.

Another thing worth fixing is near the start of gadgetfs_setup(), 
where it casts away the constness of ctrl.  This may not cause problems 
in practice, but it definitely has a bad look.

> gadgetfs_setup() and ep0_write() also race on dev->req and req->buf
> while a control transfer is in flight or while a completed delegated OUT
> transfer is waiting for ep0_read() to copy the payload to userspace.

Can you explain these races in greater detail, showing how they occur?

> Overwriting req->buf with a descriptor pointer causes clean_req() to
> free the descriptor buffer instead of the request buffer.

Can some of these problems be solved more simply, by using a new mutex 
to protect dev->req and related values?

Alan Stern
