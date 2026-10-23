Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775590;
	b=tYu0zfcKJlLF+f+RLcOhY+TK2TvVfs1nO2OjRjJ8KQo5vaVaQciBjgIouYkkvOG5F+BZ
	 LliO4UlZBOZuOWeNYEkrwLR8paDx91yHkJFp5Wy9caynvnzA+xGonprPrQZ5lu9AZbL9z
	 6ZqzPs2Ryp/Kn+borrvQ9q4sg1iIM8RBt6JRXpGhA7MR0F27DbTjbWyJ/WdSpqIv1CTpB
	 J3Dpyx7V2Z9jjdd9lQe6C0N0roYrTYCymVOOvt59bi1olZTslsADbuuobNkJfIqD5bOdU
	 y3Xlc3OeVoOwvxa+XDFiooYL01lyakXA3YD8h9YEZStH1U8NDFqxNDOBxC9Lcsd6t7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775590;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=ZXynH80RO/xGHb0t0bbutsjbUgHko3YWihcoLi5HDZQ=;
	b=o14o9++bAqkke8VGuCoPSMI6XWrS2ke4SymEqmzsKk4SR2GmUvPjNIzQvRj0p8zbjycb
	 pCUPKRe7dwZ74H5DhgC1P45WohBTT9Y2DWsMji1yagB2SmdMo2OAN/bqVFWyMkzybTN9U
	 E3yxUqJm/sq7q6NRjbxfdYfzRcpOqPITxW3ACZVoG7X4Gf9GCIFf5mWETBLvZ4pUoZdhh
	 ETOcY7mPZ6Yl1B4eJDOUBR3SEpzVvJoRD9Yua8pHzKYm+ZzLZB+7prjZQf5jwqSizTwQY
	 MbetrRZZbrBSkaUqLxck9oyTWdfxrJ/EwyinvwuUT4gV9lDMS23TcPQ/PAKdykWN0Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wsj0r7BB;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="l1/COeyn";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55C8606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C55C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wsj0r7BB;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=l1/COeyn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792775588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXynH80RO/xGHb0t0bbutsjbUgHko3YWihcoLi5HDZQ=;
	b=Wsj0r7BB81OtIgZmTRH2FOIfrKlRONHM3/8XebWURipUNlcmXRCYPmR1omWLrIjGkORWSu
	+OpJWdw8vKBrkG5SLWYeHAkxPerl/NeVbmqPZx/7vd0oI/2sbXErGpKFIM+YQ3z3O5P373
	wvJZ4y9NYgQgsYTFyGeCdGSSjb9CDA0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-PVWjQFHhMxiLyjrTrQTHpA-1; Fri, 23 Oct 2026 13:13:05 -0400
X-MC-Unique: PVWjQFHhMxiLyjrTrQTHpA-1
X-Mimecast-MFC-AGG-ID: PVWjQFHhMxiLyjrTrQTHpA_1792775584
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c01778cefso24887576d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792775584; x=1793380384; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZXynH80RO/xGHb0t0bbutsjbUgHko3YWihcoLi5HDZQ=;
        b=l1/COeyn8zpqacdcvGWkrFo2AFkeDn3bLlWVjWzGnuFiMF6kbZAB8x8HU5jHeeqUsX
         axgDCMzFz+DXPY0k/VJr8cBQtl0sFW7dRUz394uWvcluL6FhSABDoVqqZAdqMKkdcezR
         StWODO9EN9G+QELGY1NAouEMc2Zb8LtDnn9o+Xqm63QTpRm5DZ1heKA7aIbEmJW31sAg
         Nf5Yzm9oDSE8hU8BECUP7MaWcpgpkxLYewRKGohlqWVFcaJeo0L+jazX+N0UUB6nFd2L
         KJrZumPcx36tOsf10x64Fct4JSzpWc0YPB6IcH9oGaTHL51V+ZUkQFwjD0+B5sGtXDP/
         NkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775584; x=1793380384;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXynH80RO/xGHb0t0bbutsjbUgHko3YWihcoLi5HDZQ=;
        b=FGotuIDA3C78Nb2Y3GgBSdnO9hPlMJfr3rySO8Fu+eSloVVMWRa/ARxhdyTuIcE3aI
         IZVtaJ+SHkpEv+Qn+XEmAyzjnw9v3XCfqYvSMBX0pvIvgO8aWL5cv9h2sUXuwgenJrFl
         GCCTj9tAqhyVOkY6SWitKAwtXGKioWBLQcWh+TA7nfQ/EbbCkyLV8v0gYHNURD543YU1
         636IuII8YyVlHve6c8DYMcCj5eFIlqDgxnbCfuXzQxVnC7nH0DjZwjETi2wUyvsecSFY
         S+K4/CnSwJXr1+QdC5sCwVjcdbZt0xMtqQe9Rl55g2mMmNRUqiI4Jn/NmlEgU7Wc+GTR
         cgKw==
X-Forwarded-Encrypted: i=1; AKwUvBw6Sc4puiCuWcqP+HMGgxrZ38a1u74II1rz9nt7lzRKDE3VR6r9PelnqFf/OUS/TXdtXnXnxByNbZpzLGw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2jgW6LoxM2VDioaNXGVCD2Qxqna0rSdmYj5iRJkbTs6VBDpkn
	1V95DxhChYUGiNRwpyGEeydkcNUq2Pbwk7CYbh+bQD4tDyr/8Ku5tXhE9tIBPDx4AVgjKAs4zZY
	e089Bw4cnrgwuxlLnBv59jpqmbogUSxwGnehYYCTB13dGHapA750PKv85atPSDupMTOlQ94RCuA
	==
X-Gm-Gg: AYBFou00JvrKvf0KVQhgTXgHhHFZeSSXVpUW8p06rDdIp2h9y765O3fFPHiRadULCIG
	3Q9bUE8hbrhdQ2ur0wo6KjkSiAKFo4ACuYM/1Gb8TQnlSxeovFWviZOLKvCqajvZmzEUl837Pwq
	ww+L1/cKsUEcx7OBwHKvGkbC31vyTvzGwsIEnVJ3XjxkdeUkbJujQF+0tcDV6s22q2s/7KZ2X7R
	/nYtwopfDatwN5REIwEIWSBKB00TSiRabjreeIMqPK7wBoUFNOWAOd/Wad16dV3QDHH93PvDKJR
	xBgaRQLU8Io23ywlYJeF+Y8CAMz6SP99f79HxX4INCJrSXJ/Pn/tyavBwnOSzPS7SgR/OtE=
X-Received: by 2002:a05:6214:3d0e:b0:919:7384:99a6 with SMTP id 6a1803df08f44-91c3a9e79b5mr43112286d6.41.1792775584255;
        Fri, 23 Oct 2026 10:13:04 -0700 (PDT)
X-Received: by 2002:a05:6214:3d0e:b0:919:7384:99a6 with SMTP id 6a1803df08f44-91c3a9e79b5mr43111616d6.41.1792775583760;
        Fri, 23 Oct 2026 10:13:03 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c4522855csm6449066d6.16.2026.10.23.10.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:03 -0700 (PDT)
Message-ID: <8a025f783533d40c0486a8a511e8811b0e52f466.camel@redhat.com>
Subject: Re: [PATCH 0/2] drm/nouveau: fix GK107 VDPAU regressions
From: lyude@redhat.com
To: Kush Chandak <kushc451@gmail.com>, Risto Pajula <or.pajula@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 23 Oct 2026 13:13:02 -0400
In-Reply-To: <20261022153712.11208-1-kushc451@gmail.com>
References: <20260913201225.5975-1-or.pajula@gmail.com>
	 <20261022153712.11208-1-kushc451@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

I am going to look at this patch when I have a moment, but I am in the
middle of moving right now so it's likely going to take me a bit,
however:

On Thu, 2026-10-22 at 21:07 +0530, Kush Chandak wrote:
> On Sun, 13 Sep 2026 23:12:23 +0300, Risto Pajula wrote:
> > This series fixes two independent Nouveau regressions affecting
> > VDPAU
> > hardware video decoding on NVIDIA GK107 (Kepler).
>=20
> Tested-by: Kush Chandak <kushc451@gmail.com>
>=20
> I used an AI assistant (Claude) to help debug and test this.

Please don't clog up the mailing list with this. I have seen multiple
people now going through and 'testing' things with LLMs, and the
reality is I'm not going to carry across the tested tags.

If you would like to test, there are plenty of resources available to
figure out how to build a kernel against a patch on a mailing list to
test changes. LLMs frequently hallucinate and lack an understanding of
the tasks they perform. It's already difficult enough keeping up with
code submissions, and given that you cannot use LLM output without both
vetting it, and having the knowledge required to properly vet it, there
really is nothing I can actually establish from "testing" like this. If
you weren't able to actually test without using an LLM and we have
established we can't trust the output of the LLM - how am I supposed to
know it was tested? I can't verify it from what you gave me, and even
if I could - that's just doing what is way too commonplace with these
tools and offloading the work of verifying anything that it spits to
others.

