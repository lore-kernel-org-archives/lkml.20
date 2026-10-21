Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560652;
	b=m8xxECuulYSD6yrZSGbLmM/eXSrqf3bNnxiCVr93Q8xWzTwl3ML4OEMvuFMaJb/xUQrA
	 p0a04PQRmVEX9WfbOjJlc4pQwwg2qYBcp4A/J9QLxOesdjeYD9Nt5kJ693+6M8T4o/gYW
	 mJ4z+iv57P3cKmkSllf3jDob5Im8d3R5r2LOno7yEKLBEoXENpW0wzNLwRatUn/ANNfaU
	 zyWS8LMRDgfSmGSfiyJ1JEQqBjJKh5GCJ8buXa1LRRwzXX+sd/0Na5kjdvG4+6/mQo74q
	 2IyT0MYPo0KtQjjHDkJY3+NhMM0+i9W+0GgzlYXnp6JntM0rZ/DqFMa9ylfxggBauvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Message-ID:In-Reply-To:References:Date:
	 MIME-Version:Content-Type;
	bh=wOxW4z1BbQYP9uEvGV85h66bQb0xJWZvNtv4eVINyQQ=;
	b=NwREZ2cifbD5XdV8Xxg4mOcbICntVbFSEyD4NDCfYq88cTkD8JcoreOgrJC94zngWPEW
	 TCaz0M9KItNrswvrHg+olRZ1SWjeXHZlB1Cb7Jwk+m7aXgm1508ckOYV+n1pTVGUr3z/0
	 5iLl37GEE9sUr+yOELXVN31nWZN9OIoXnhxy+gkqbAeGuLQXZzM0hVYf5INTpqait91jY
	 7AQrCOTZOMVRb589Cma7rJqGpoKrcFb02kAtcC7m+YB1RrPX//KL/QO+pQ6gF6DohAylT
	 QZvLbrzel1muIuaMz6uKZ/rraxyYMWtcZ76jJHEcs5nNg2ZqRfT5ICXU/8F4sRiXaxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=innovatrics.com;
	spf=pass smtp.mailfrom=innovatrics.com;
	dkim=pass header.d=innovatrics.com header.i=@innovatrics.com header.a=rsa-sha256 header.s=google header.b=dZG9+Qrb;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6645606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6645606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innovatrics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innovatrics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=innovatrics.com header.i=@innovatrics.com header.a=rsa-sha256 header.s=google header.b=dZG9+Qrb
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1f68a9855so1635435e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=innovatrics.com; s=google; t=1792560650; x=1793165450; darn=vger.kernel.org;
        h=content-type:mime-version:date:references:in-reply-to:message-id
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOxW4z1BbQYP9uEvGV85h66bQb0xJWZvNtv4eVINyQQ=;
        b=dZG9+Qrbq6r8virMQzN/ZnScSqFL9UpktW2+0+n3rDobwVeYO2vFRf/TLLKIVXBmhF
         Gy8RLB4EpeJSlAY8DjkXHht8NBPQbM5e5fFurkIdO9DfEYRLT1UnIUiVHv5USugAATTU
         SMpXa/vr/CV4YYNC5DI0uYI78q0K+X5Fj4Q/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560650; x=1793165450;
        h=content-type:mime-version:date:references:in-reply-to:message-id
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wOxW4z1BbQYP9uEvGV85h66bQb0xJWZvNtv4eVINyQQ=;
        b=n/Rm7tiXs4gWIy6pBycoh/bncQ1ebVEnUYP//xTs/IeVxpnZtIl6IPxYz2ySFWFXjV
         vmLnJHnvwu+wp5LTCJ6wLJXL/e3HAnndilCNCRetxPhMwqgmZheABBCtn+1vRUj1dxYv
         kZ8vQ1jJ3FAkhOrTajs/tF4hNSokjiiAOZLSm1YaRkV5b60OaDxWMf9suxMrjlj7J3U1
         aiD4e/27Yl0RxBLkkGFkJjAhd/aNru9cquni551yqRWV0Y7u95SS+4zELDouYv8LHwrL
         60vB63KZ9gkw+VY8liU7lpKxv84fyUGnm7Hi6z7lM3Fy+gs39HGbifPPqYkaiCPYsXsU
         DpjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQaEKCKdYdkvAj0WHKL+zrSW7p9E35BYAAA0JOYtx1XDiom4V5/WErKFgmfQ0OU66Ugl9CRvIRUUz/vYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYQP8ZU0hYUb4YxOWkN7qJPpKi8Ry9m+7CgmZJ95WiScz560O7
	cArMeETnm5cu6P3bXOZhtxkFyNczugAZgYugK4GKG1GJWosoiXluASeH1RQ7YaZSYg==
X-Gm-Gg: AYBFou3M73wHiokNY3jSbC/X+UXtFDVq1aWKp5yR+pR1PbdB9dgyweNaHK9PV179gXR
	TYp2LTEaN7MA7yoQcPBz7wjOGwJWjFc73XeFgFED2pxGgu9KF4ttVFf7xUmv9xQJbH0hv+N26Bz
	xospoqJF2SmZhS3aJmrxiDr5StfHO/Cikb7p6Ax20f3dCXYnUjo7mB3eVOmzS3waEeozMxthRGQ
	yCzs8h4Ad/+m9Ti56bhh9Ie5sW/ojrYkGhY3dd+whu82014rEWXQf6Mu1doBO1Z1eKrcS6ZmWHJ
	kMxDZo2iQ6YdxxNhGTeR8uiGSTTZ93mddiF6UZ49ezWbXoOr0MINORA/zGyKmKTrP6NCVG5eQgA
	dDg3rztxXVMvlvPdWJtcghqAQIKDnxQ+3Ym1dk9had0ikUwCL3F5yHiVFImdWwNrpB2DUoZ7ydW
	XXM81aeA8GlnQ/hIXuCD7BGkhVYnLRQS/bEqb04Dr9okltuIASC4CHfPDsiB5tP48EX6hEzAT+t
	a9eLwxFr9GBY3mOpABbsRP2TjUS6RWkkGJNVM7Igc2ojRJNIQG5wBWXYtePv3flgcPD5Es/5RYr
	r19GNAv4TbcaVwCo6rpfmVQyHAL0pQMnM8whio7AfL5u6TQPeHtYbuxV+x3XX4ODm48nQQSPyb+
	rW6FOWZG/1XNP
X-Received: by 2002:a05:600c:4686:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a1fd72e1e6mr17106685e9.0.1792560650270;
        Tue, 20 Oct 2026 22:30:50 -0700 (PDT)
Received: from [10.11.72.5] (bip-static-148.213-81-147.telecom.sk. [213.81.147.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm85779985e9.5.2026.10.20.22.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:30:49 -0700 (PDT)
From: Petr Chmelar <petr.chmelar@innovatrics.com>
To: David Howells <dhowells@redhat.com>
Cc: Christian Brauner <christian@brauner.io>,
    Paulo Alcantara <pc@manguebit.org>,
    Matthew Wilcox <willy@infradead.org>,
    Namjae Jeon <linkinjeon@kernel.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Stefan Metzmacher <metze@samba.org>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Ilya Dryomov <idryomov@gmail.com>,
    netfs@lists.linux.dev,
    linux-afs@lists.infradead.org,
    linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org,
    ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev,
    linux-fsdevel@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 4/5] cachefiles: Don't rely on backing fs storage map
 for most use cases
Message-ID: <20261021.cachefiles-mainline-confirmed.pchmelar@innovatrics.com>
In-Reply-To: <2648476.1792482342@warthog.procyon.org.uk>
References: <20260910220242.2165023-1-dhowells@redhat.com>
 <20260910220242.2165023-5-dhowells@redhat.com>
 <20261011.cachefiles-partial-zeros.pchmelar@innovatrics.com>
 <1655268.1791878098@warthog.procyon.org.uk>
 <20261013.cachefiles-partial-zeros-trace.pchmelar@innovatrics.com>
 <1995693.1791971125@warthog.procyon.org.uk>
 <2648476.1792482342@warthog.procyon.org.uk>
Date: Wed, 21 Oct 2026 05:30:48 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"

David Howells <dhowells@redhat.com> wrote:

> Note that these patches are now upstream with this change incorporated.

Thanks, David, and sorry for the slow reply to your question about
the fix - I was on vacation.

I've now tested mainline (72a16bcff2) with the same reproducers as in
my earlier mail, and it fixes the problem.  All 4096 blocks read back
correctly on both full reads, and the reads were served from the
cache:

 - 9p, cache=fscache: 0 wrong blocks (936 on 13e340e397).
 - NFSv4.2 loopback with fsc: 0 wrong blocks (817 on 9f8b64f66),
   also after a server-side rewrite of half the file and after
   truncating and regrowing it through the mount.

Thanks again for the quick fix.

Petr
