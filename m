Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7027757F72E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970327; cv=none; b=MDPsP+NdfjHVnRRxbP56AJUi7raiuYTqjS4bhTIL5JjU9ofullxrayLuOcnv8yjZmj+DDUP16bLgrQ7M5D5gfmj1IMzsjfCeQUUhG/Hjtv6bNeck+FiSEC3zUJ+An++dFH8C8dtEaoMskF9UYP9icZXT7Y1Hfsa83VUn61GDLUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970327; c=relaxed/simple;
	bh=hiRBQugCjUC2qSlftimk1/dBleMnW9pQ7uDf9NI+8s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFUJsaEjHYBYTAlbjahhb+MO28sxitBnyK3/N0lDvGF0+pKDuUz98cH0wOdIh3aJm5nCjPw/Yn0pvBIiGAHpyfHwPOYKY8SVFEMgJmwoun2Vsl402Zy9f0GORFyfQrWg9zobTxGpDVuXq4M6+YPnggMnURcGql/Hh6ca17Wii+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fEEL6qQC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=o4YnEs3p; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fEEL6qQC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="o4YnEs3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788970325;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJ6zoCiMWbIIPldwdYsAIIdGbzVoK/NeTnUzI9OwSjE=;
	b=fEEL6qQCb8HKV0KV9xlcYaoSJLzk9BHXu5yKVDHIzQ37BQEApQEYrdJJ7n8xpdr7+z8p2V
	VNbZwv6+D0Nj3vJwrixtVVTEfxbntptCJPkls/+d95JlXOeACOPtnRoczq29cyYRfVSmdG
	KGeySNg+DmNu6qKutR6PMXiSOrwDhAo=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-NPI3AdH9MMeKFKUxwyCrsg-1; Wed, 09 Sep 2026 12:12:04 -0400
X-MC-Unique: NPI3AdH9MMeKFKUxwyCrsg-1
X-Mimecast-MFC-AGG-ID: NPI3AdH9MMeKFKUxwyCrsg_1788970323
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66f7fdefb16so7874163d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788970323; x=1789575123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AJ6zoCiMWbIIPldwdYsAIIdGbzVoK/NeTnUzI9OwSjE=;
        b=o4YnEs3pjXs32JV11ZTN+Z07f9sE53EaRa5Xm3vdp8cEAgsWDZMBVw9jetRN+D94I3
         gZSmF+x9a50/b3OFTPTIK4YhvhSCR7Zf2FoY93z9zGz9Xhio/rhcy7Il11zRyLhtFlBJ
         Tlx6YTKR5dZsrF6TaW+xjbaJz/hc48HlZY6CQ3YJiL26qFlgiX7gn5LaBBCAwKlWD6fG
         4ePlgVRUNjFKOtjGOqM0JJmoM8YxBsJyQ6ypBFpAozrTeJ6ze3+xDhEVQOp0P7YlX0zN
         IrhY+QRjE0Azqw4qkBD7ybxcPRv2J8NifG1LC/10Mx+jb8rWRXkJSihf4pwyLdi5fhDY
         EIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788970323; x=1789575123;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AJ6zoCiMWbIIPldwdYsAIIdGbzVoK/NeTnUzI9OwSjE=;
        b=T7OlY/t5x0GoVnbRcKg2YLQFZL/eoGdRCvieZq0WUSftEX73EXIu9Ba5CNRobLKVMp
         I+MxOOhmSMPpMo1h1iaoAlaehuvq2grL77/f8GifWIyjAUehYcti0cys6Gx+8NkXdwnv
         iW+YCHj6jbpJCEKV2v/Q8V7wOyOub9Od0D1B4eJRaPddGMdtep9ulEemMq1AjtET3Dkt
         /E0wARenb+fFbO8VQL7I3dq0LlNTlfpcGZSLBJVvhM0QkFN5I+ZEL46ofzRgVix/TGqS
         1r2D9aiSZpf5aQy0/LfPD5FOhlXqbNYOcqEit7x703/iJQD3Kij6EdVGms8xShCp3Ism
         3cgQ==
X-Forwarded-Encrypted: i=1; AKwUvBx//kAMQrLeShKSHwoPeOSJc6Bb1/7027OVDmbjU0aO6m5f7iCnmMJVbzauCLYmhfIGIKgXNnusJBed6HY=@vger.kernel.org
X-Gm-Message-State: AFuF++nvjShIfIevOh03Gv+xLONFrgELKY+5ty/iqcM5Nw2OWuPyzEqE
	m/lvVGNtTxy1WyFgt8HtD+J7Z4+SHp1P+IJwVkFgpULQuq87tb/ZnhqIonaQGl5UQLIOrpFSlW+
	6LUfb6n5pTYPSi8HlKgESAMA95SR4MqpJ7Ls3+lgZxQofAQkVIuKpQ5E9/YrqLrXRhA==
X-Gm-Gg: AYBFou2ZdcdHW6kTvgMCy19WxpO2v7UgawFIRPyWB5OxagoStpUL/Ab8zs0qhWdL1GJ
	V5dpqx7fMDzObv4fVwHmOd+7/vIQWPJEMjKNl2rs/z9ntCTIJ30UnRsUaDra/85EZm5GUQgOO9K
	ItBamf/bxGtnGL4YdSbw7D+7jNi31k1ORX34lu5fjQyZdHfSh2m7oAsJphLaeRc8FZfRGuVXZVk
	kVcLKQl28qbR1Wtfogxbg5bhCfR9VQT8b8Rx/3Rm+Igxr1gse0l6E5xiP8gv3WTPpZH/8XnBbmS
	s+peBcO8rREKWlXTVKvjIW3/j06Vg4v2fTX+keNMXS72OzDLap84e462cZ7H+1bPvjBFR9xmsCJ
	NJXYXtNpZBmBI5x99fb8SVf29LETwNExVFlFxU/X5
X-Received: by 2002:a05:690e:bc4:b0:664:c3aa:66f0 with SMTP id 956f58d0204a3-6710371652emr2217253d50.39.1788970323424;
        Wed, 09 Sep 2026 09:12:03 -0700 (PDT)
X-Received: by 2002:a05:690e:bc4:b0:664:c3aa:66f0 with SMTP id 956f58d0204a3-6710371652emr2217055d50.39.1788970318005;
        Wed, 09 Sep 2026 09:11:58 -0700 (PDT)
Received: from [172.16.0.69] (c-98-227-24-213.hsd1.il.comcast.net. [98.227.24.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb47a8b8fsm12713671d50.2.2026.09.09.09.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 09:11:57 -0700 (PDT)
Message-ID: <afd68097-b2b2-47e5-889b-fb077e7a9247@redhat.com>
Date: Wed, 9 Sep 2026 11:11:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: sorenson@redhat.com
Subject: Re: netfs_read_gaps(): aliased sink folio makes the read destination
 unreadable, SIGBUS on cifs with signing
To: David Howells <dhowells@redhat.com>
Cc: Paulo Alcantara <pc@manguebit.org>, Jeff Layton <jlayton@kernel.org>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 CIFS <linux-cifs@vger.kernel.org>, linux-kernel@vger.kernel.org
References: <a385053c-1c4a-4060-a3bb-befa007ddb33@redhat.com>
 <1714046.1788952509@warthog.procyon.org.uk>
Content-Language: en-US
From: Frank Sorenson <sorenson@redhat.com>
In-Reply-To: <1714046.1788952509@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/9/26 6:15 AM, David Howells wrote:
> Hi Frank,
>
> Can you try this?  It can be triggered manually with something like:
>
>     xfs_io -c "w 100 100" -c "r 0 4096" /xfstest.test/foo

Hi David,

With the patch, generic/759 now runs to successful completion on cifs mounted
with 'sign'.

Two things, though:

1) IIUC, folio_alloc() returns an unlocked folio holding a single reference, so:

         if (sink_to >= 0)
                 for (; sink_from <= sink_to; sink_from++)
                         folio_unlock(bvec_folio(&bvec[sink_from]));

unlocks something that was never locked, and never drops the reference.

So should these be folio_put() instead?

With CONFIG_DEBUG_VM=y, I think that's a
VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio) on the first gap
read with a non-empty dirty region.  My test VM has it off, which is
why I got a clean pass; but with bpftrace, I see 190 leaked order-0
sink folios (760 KiB) over one generic/759 run.

2) if netfs_alloc_request() fails, the kfree(bvec) at alloc_error is reachable
before bvec is assigned, so I think we need to initialize it to NULL at
declaration.  (It uses mempool->alloc() directly for the read origins rather than
mempool_alloc(), so it can genuinely return -ENOMEM.):

        struct bio_vec *bvec = NULL;



With s/folio_unlock/folio_put/ and initializing bvec to NULL:

Tested-by: Frank Sorenson <sorenson@redhat.com>

(but I'll retest without those additions if I'm mistaken... it's happened before)

(as an aside, 'git log -S' on the bvec_set_folio(..., sink, ...) line puts
the aliasing earlier than the read rewrite -- should the Fixes: be
7f84a7b9892d ("netfs: Make netfs_read_folio() handle streaming-write
pages") instead?

Frank

-- 
Frank Sorenson
sorenson@redhat.com
Principal Software Maintenance Engineer, filesystems
Red Hat

