Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565562;
	b=4mAqbk4ZlEBHUA7jyx+Eh4wKew8E8McLzBeDf6QXo2vLTbqLY2jbRtnQz1/TLtDTDEek
	 PQBQrtsLfSOuF6g/7nb0JKMx5/dQ617Mwyr0Y5ujRSzdDu6kucBeZ6U3yxsarK0TL9HTN
	 2b1K/FL8m+Axfa3HpEa6533gES5a7IrzFBJVpTOvGkM9U1fq3hDCtcB9MUbmIIbn8ftGH
	 6pinwAzdjCacXf/ZqpJQc3s/ukaD8iiTpiL5u3QlXl0qlHwpjAb/vLYB+bzIxgrYzcU6W
	 iW/8Y9IzLvEg+s3i3h0VUnN04sPBKcY/RFBROnycgpSgeyhEXoSQuOM0m7e4xmvWrGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
	b=WxyqWjxogtSW7E07qydtlXOF0lSXfxQH4WXAKSl5XtBbk4yEOSkCeV5IHEp5xR51YCJf
	 ZSZfe6CaxWmI7YFCIj3zxQg330NpaxSuPu6ZDYJiRjMEx7//KN+Rrjcva1btUdDr8T27H
	 efso4Q3UQvAeeEt2tfHo9M3IgT34LHCDudOnnOxAp2nWztSiPja/9gaDjKn8cNWii6Gw7
	 vp1Zf3PgfzFjHmIVc5km9GEiLhVI9xmWdpzmhtILfLFY0j//2O6GTopiNz3CIeyQMNI3G
	 wvUIJhG1BdifSHAPgIPlNASIunGSOJ/5YR03ob0l+8rC1ugR7gc90X4bGUSSs2Susjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EhCy1rjV;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01F8606A893
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D01F8606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EhCy1rjV
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49ff9833fedso1224245e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794565560; x=1795170360; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
        b=EhCy1rjVxVdFrlqlBXdnWdhZOgju6UqPO7MHP0T5eDQlLH3bu4fGnJjBmSeu+X4e2W
         fqknndYp9WUsPcSw+hMOJQKeOCVQ26f4CApHOuaHiz0ZnrEcpw06GAGjRX2e/v0KskXR
         kPbczhlJA2JL/E3RYwJYZ55bjMsTqV1bcwrFG/iNBMGzSlTlhWz25UxyOw6nI4axYZSB
         u0krz81cE8qJBpZN+Gj0XIkGJFuZa0vCttP7+3dXPKfvLd7fzcQdMwTNK/JaleYs6P1m
         dJAReh6EvrYwFB4nFlJdvgjX0mrHV5c8k7KozarvFnbaOIXtcKdLHY5nOcL1YTJjLQtf
         x2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565560; x=1795170360;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
        b=2eZuZkZtFvg1VFi4cs6kZvYPtauPwPPTTltqTP6ljkKh4b6tHYVh/sXeLg/Fiqvm/T
         mZ2uOMlqzN52FG6QY9I332srmjINc1Yq085Dh9IaclbTxQIw4b7iHSHLAmsYItg7uxQo
         Nr2ukyU6tZ8z6w/XqydWoZSb1sMgF75RDXkb6pbna2jGwfQc4PK3C+jtsnfutk1HDSvl
         KrtOazGhzJ8Ev/Tdmi1qkT8riv1Ou1YuJNtbRJuIrAcT0F/D/U8HwQn+UnVd7YuX95Fx
         8ZBpT4mwFbSSitexjHUwOFfPAKJaG3DergxdULxHbloVxJlCMFxQXn/X26//S5lBCwnA
         vdTA==
X-Forwarded-Encrypted: i=1; AL+hErFv/2mpn5ypQ0k75CkAL/Z0KAPB3LdMxLVgHlGeVU5sy9w+BKT6Sw/X7Ak9XSezA79HQIkKtw40qg1yF70=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qTAn3QUyJLjBzlDtDcdk3fiyYxtf1Z35fjyw5ZTpUF6KhGIEQ
	nL9VtEiujK1QZCaMtdfTaIxAFeJNq2YKPwZm7HTWlNpzEmKEVM3iNuHbofZArVZL6XpX
X-Gm-Gg: AYBFou0l8yI8M6yMlaj3hV+d8SKlDE+LbFKJZwVNaLXq3F3kUauviEesWr3j4v1mFTY
	IacTngBSuoez+1M+UU3eFAxqNXu36YRU94iYtDVPj3DQ+VC8dYxq43VugbP1YS8M2TSfTH9YjtI
	9+pvkyQ14e6fWRqyWZ6RqdpzonwfcFXHKdnsx8slJC2ETZwqAGr9N2o6MjJkBJn2MoxRgdh8+hq
	jluF3kd5L7ycUHpaH1O1KPviLAH1MhKF0aoG3VyT+BNVPKymQ5Vi/5IsI5NcPQl/SwM2iplmQXw
	VeBwchabakjY1fuZCQDoZXt8NlIB5NPdUu4FcfALzOt6uWL+X7iEIfM6KU2niH5SxapP9sM/TxV
	oz0yAopF+2z8Urb52IvpUxkWwNusemWijKpM20hXAhTsLU5vGRgOZrwC3aaRiDuytPgsM7Lx5VN
	LB1RYkMEDG3KK4k0TSt29G6WNEZw8aTjFHGppU5fXHw9Uxf3goa45k4g0ZuQk8kNHcisCzj0iA8
	3wGby67uBxHEnqyu+BN+No+amkLXTsh9LquY1qgtDzaWEzbzkqyJpYf2FtnFttvykWonc6uDD3U
	+w50Cz7HM1i7tOaqPu954/qQshaE3cAS3oodZa9T/HuP3KrVY30Fl4H9VTd/JOo=
X-Received: by 2002:a05:600c:4e49:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4bb55aa999dmr38995625e9.33.1794565560090;
        Fri, 13 Nov 2026 02:26:00 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm244439965e9.1.2026.11.13.02.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:25:59 -0800 (PST)
Message-ID: <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, Chris Mason
	 <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 11:25:57 +0100
In-Reply-To: <20261111151202.GA11391@lst.de>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
	 <20261111151202.GA11391@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Christoph,

On Wed, 2026-11-11 at 16:12 +0100, Christoph Hellwig wrote:
> I've seen setups where people use fuse to mediate access to sysfs
> sysfs in odd ways.=C2=A0 No idea if that's still around, but if so, this
> patch will break it.


Oh, that's painful. Do they use backing files for that?
It's a relatively new feature in FUSE...

Kind regards,
Alex
