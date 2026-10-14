Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E42F563295
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002291; cv=none; b=aNPsilzjiMmXppfQv9ssJX1PhHLgkoaxAKbP5y1F3MqCTpnLCM8MlKG+eRSSpad8rEgFMKx3zwM1FvkEs+WPQdIuiHqARj5nmaO6e186kCTCHBdBpG9DKBVlnuP4JmQ/KC/ekbkk123DUVfbJ1XUA0+Nv6xvhWlukObHopE0ujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002291; c=relaxed/simple;
	bh=Sa9VVkPx6DOTDK0XO7+qTUjUK7e3AZfSaFMLtRzfnQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVMFbANtyyimJfId2IB7IwLicnzv/L1lx1mg2Vp9TL+w8vQcVYPZOY+qeZb7z/E1JKSzG7UTgxtGb/JK3PlBmmetxaoWVmdfa7+1ynG6a7VeOKu7650wXMd6DcmfINwZkqvNW/eQOCsoLpjpneWxUJ5hgduMfO8iM1ALvsMafqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OVrqZ2r6; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OVrqZ2r6"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e6df2742cso688400166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792002286; x=1792607086; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RklOVidugQxXD9UNgFNiDO0jv9PvJV28lokKFTSWA+o=;
        b=OVrqZ2r6e2sXdBcGqdn/34nTJpOl2rcW5f606dQZrg2ZVNANn43lFnvSbWnLo8+3qI
         Pe+3xgBX0GiBONi1tytFFtWnxJDGHF/6o/lpT6YwQOA+WdnSu+Mjl4Bc7NnxxL1fmE0A
         tUN8t9oiPQRmQjyTyMcKYPS+UierC9YahAQJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002286; x=1792607086;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RklOVidugQxXD9UNgFNiDO0jv9PvJV28lokKFTSWA+o=;
        b=ad3UigN0C6E2gBvedYUEeeiSkZ+0Ng4oaUYCMUYUva3kIEWxHJnYsgX49OXZFnW34/
         E8e8DjtdQeJQlagDx8USM/YRETJa3qf5DbEFl4I7CwV0ISXZk4Zb+l4OVZqoGLtDz5f7
         1a15ooGeg6zIrDRIze53IQPgSIf29ny0FQji4oWX9bdSsYQb7burpQjvHD0k20zSqGj1
         h4b6CaNyzea86+Ov6f+qUzwKUuiU/skx5J5e8usZA35qOzne79XsVBhXUdnUvuhW35Py
         SjQJ/CTRtfTO6npzkl2QFOQ+N5VV+ifWgfU6RzYl7mDaTaBddIgxD32CaWdik1YR82KN
         Ba6w==
X-Forwarded-Encrypted: i=1; AKwUvBwWvDVM85Vtpq1bgZMQZw3NIquAIgzNv82YAxSOfX42APabpEIFjOgv6wyT+wNKQiufWDMh2MN85skR+Xo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcj755KpCyW2Gc8E02XZUIhON55awLiFpCJNfaBcWZKEIWLD52
	QfreqfMAkaz9HdKQiQH9YF9sjkvfyIsz/xK/Kz8yE2OM4Bb+aQGc7cqSebpnYN3PhY/qWyIweeE
	4r2+KdDg6iA==
X-Gm-Gg: AYBFou38LF5c1Vk84AFGJZVGJHEw4vb1KolFjkP/H96zrOuWYjJf/MXeO0W3aFmtIRa
	stTSomliBSdNtVIO1UPy6nH5GTJj5PEMw32tJ9pZFbOE3Qai+dTSgXghYmmJWduKMnUZTjQkoOf
	b6NRwtahYh3upQ3hQdQjaHeP5Fj/niuwZj+NnxOgskQ62R3od6MlC7QRQrGY2GSk8Hu0WOqI4cU
	uNTDplcwB0O5zTGjo3L0tvuQY8GXwnX1Xxx2t9LyvbewchyX6iVPTtrf35l1NUlvkdZ60LeltbX
	Vq/DOTWGZxvyAKHolQMgZ24sqbwT+TotpikExlQFBi64SoqwYjV06kk6NHGqdPWve8iQZa+1wuz
	wX03T4MPHWV7jbqfsa6bhTdfnWUYUqu5x0tMaRjTw2+usfwnew3KsKzwhmFIHSOrroY14kiOGZF
	N0ICT4eW5tleLizFuTGTPGv4MbZ+mWjqBy3KUozHJtXXhDOK2ndtoyBc52Vvr5UbsqfeAHOfY44
	itoHaZpkEmUIFv6dQpeGTlhU37Vsp0w1jfrPE2oG6E7zGBD6drzTOKITkU=
X-Received: by 2002:a17:907:971a:b0:c2e:378c:8cee with SMTP id a640c23a62f3a-c31aa05bf43mr1537364966b.34.1792002286450;
        Wed, 14 Oct 2026 11:24:46 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda041b03sm13798966b.53.2026.10.14.11.24.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 11:24:45 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c262f1186f0so595383266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydkXeZdYix1oCVJEdS2sMGxYxGSntbi2/W+E6dCP3NX7O1ehIuQEgjUyLPJaSbNQFzpgbBviCfEAOpsKA=@vger.kernel.org
X-Received: by 2002:a17:906:7313:b0:c3e:c599:169 with SMTP id
 a640c23a62f3a-c3ec5990f58mr73949266b.22.1792002285129; Wed, 14 Oct 2026
 11:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as690Xcu7FxIDYjf@thinkpad> <CAHk-=wiak+h+d2tZ5W_MwRzatUP=hJKn7cpGjDxArG-gwgHLXg@mail.gmail.com>
 <as9-2cIuGuXwE2Oa@pedro-suse.tail5790ac.ts.net> <CAHk-=wgkoAuxNXga29nQ8w7GxdqR+4vPAUhPsbfp+gzKrb9EgA@mail.gmail.com>
 <CAHk-=whzkNzkBmCspHYd80D1Z=krDc4SgVC32=pJ5PtEgqSDrw@mail.gmail.com> <3c613725-406a-4506-b788-987a337b9771@app.fastmail.com>
In-Reply-To: <3c613725-406a-4506-b788-987a337b9771@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 14 Oct 2026 11:24:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh+1Hz+3HJ8evmh=FKO1fCGiwuNTqArXEfe-tAJ6hDy0A@mail.gmail.com>
X-Gm-Features: AclHuK8Xr9cbB1shH6xYa6oUAEmAg7bG24kVsMU7gBf-QzCkJVoGpHArbyivVDg
Message-ID: <CAHk-=wh+1Hz+3HJ8evmh=FKO1fCGiwuNTqArXEfe-tAJ6hDy0A@mail.gmail.com>
Subject: Re: Improve page refcount scalability
To: "Kirill A. Shutemov" <kirill@shutemov.name>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>, Harry Yoo <harry@kernel.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 10:44, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> I already have it:

So that was my thinking too, but I have my notes (from the original
truncage/hole punch patch) about mapping_exiting() being problematic
due to f2fs playing games with it.

Now, that's probably just a f2fs bug waiting to happen independently
of this. But the path is

ioctl(F2FS_IOC_START_ATOMIC_REPLACE) ->
  f2fs_ioc_start_atomic_write() ->
    truncate_inode_pages_final()

and that truncate_inode_pages_final() is the problem - it's what sets
mapping_set_exiting() on a live inode.

I had this as a note for the original branch, and it became a
non-issue with the change to the "set PG_rcu_free on hot pages in the
read path" instead.

But your change makes it an issue again.

Now, I think f2fs really is just buggy here. Calling
truncate_inode_pages_final() on something that is still live
afterwards is wrong - because it's not "final". As far as I can tell,
there may still be hundreds of active readers holding that fd open.

I might be wrong. Adding Jaegeuk to the cc.

                 Linus
