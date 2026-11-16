Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842570;
	b=euJPwdgPU/Im17Pgfv4ifC9ztwFbPvaBT2Elmmm2Amgfx1n5Q1lxOHqZPHGdutP2vRDk
	 mXDcdpDrzF/YufZ6vUktkaU3+UIAEgnp+1Ox+whZiMTtHKpzMyucQEVndJYJaLpzlnDug
	 qehe1gUF5NZkuor+V3PQPq9QngO0tNJsnrz4kB2/9sRV8oaZsGqfjJOz5sx05ggTGl/lO
	 JISTOphVC6fSs2uU5ZR3wAZhD50Umr9uKfY9EDlt9s+ci5N1bOg+JmxacAtboXcs/2Q/L
	 +2A+FQdrdRNvecY6YpR5bnsvnQYNB5QQyIuEM5asMPx3gGk6B2oS4rU9R0TTiGgbASg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842570;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AFA1cIRKffIxRkyTuIqcB5wi2vdgP455jPVg0Gxp6JM=;
	b=cWzkL9vF0lDUFXozjL5eDOQ4OirBCO5lExSRbvPsgLjDAezGZPyJ5w9srgrKmyyF81pd
	 bNEOyrhQYLfldcD9EuAKhggdSvv36MJkO6vpKWSNeRfboV0avIpdQ1BFI0UvDGw1qaXgI
	 3u7o4bKVek+oEz3h2DwU8n57cIIMtNPrP5eiAw1tXCxJh7Q0ksaDC+vAN+PpEadaT+QsQ
	 WzEUJtLOQLDQwEW/1Ay+QMybZMxIdWpDoularJz9hY5jvob/MQIjwAy0r+W398V+IgAVJ
	 69ar9b4pw6bysaxyYRaOPGn3kQe+geQgipbqp9Y0jw/DkUt53+3q+D7zOEdWu1LrmqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jtg5ZyoG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47DD606A339
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jtg5ZyoG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6E91F000D0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794842570;
	bh=AFA1cIRKffIxRkyTuIqcB5wi2vdgP455jPVg0Gxp6JM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Jtg5ZyoGIn328AVg8XzqwK13hFEIiEy+XwbHeyHaRrb1NrcBUVWuyQH1fmKYlf9ZU
	 0YxhYl8yNFloEB5b6HRbL83Iwyx6rWjv9P4NqVweROQvlWJ56zh53MbZjbHcYQdLyN
	 R6kN4kT4csMGldvM2BlZ8XGrRqMpkJT07CmkdDkjXYRebAnlSS5t3vifLjEPnKixAL
	 b+rx9dGAd9+y4EqueNtFndTgShfDDfIQpCryI0GhGD9HLPwnW53yL4OVOaXJDvZH4t
	 zcOmEIU3Eh3obx4jS5Ks50YG/UAE5UKQ/eN4s0TAIkOoLSr/FwWinmCcdVYO+qkhPj
	 ddaIZzbdGK/Zg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c102ad8420so3471108e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:22:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFd+hhSKPHCGLEe666+THhFgQKW8EfQJB0G4cqOCXP2mRqzYvYuaDlMOVmeJFCsvbo8Wtxp1gPdxGV57rM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B08+ZIAc+arfwXEPTP/iqZTk4UMFaTPrczk4S3HfC5g4n7TCd
	lhjEdsCuwe67DCn2MP4jdV9SohpYkR/OT68fYr6qPNnfr2D1uV1QKX1s3t//kw/Z/ytoqdKEt70
	BMpoZh2nyi+bSJ5Vscf9j0nSI0A2Acw8=
X-Received: by 2002:a05:6512:1391:b0:5c1:5bd3:c960 with SMTP id
 2adb3069b0e04-5c170b5d89cmr3774298e87.55.1794842568821; Mon, 16 Nov 2026
 07:22:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110085125.2535508-1-johan@kernel.org> <20261110085125.2535508-9-johan@kernel.org>
 <CAJZ5v0g+X0etuZSoTrFr2OXgF9o0q+LLLTcQSfvo0A3dib9M4Q@mail.gmail.com> <avsZN96lgaW5IHdh@hovoldconsulting.com>
In-Reply-To: <avsZN96lgaW5IHdh@hovoldconsulting.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 16 Nov 2026 16:22:36 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jVUzMaLR3dhO=t4HCN5XcUhY_uki7VO=ksr5PXVmY5oA@mail.gmail.com>
X-Gm-Features: AclHuK8DKN9QEQiR10PdUj9dDcBzh4gS6OuZIwlhscI2PjROsX8tIWktLN53RT8
Message-ID: <CAJZ5v0jVUzMaLR3dhO=t4HCN5XcUhY_uki7VO=ksr5PXVmY5oA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] device property: fix fwnode_get_next_child_node() comments
To: Johan Hovold <johan@kernel.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, driver-core@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:54=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Fri, Nov 13, 2026 at 06:49:54PM +0100, Rafael J. Wysocki wrote:
> > On Tue, Nov 10, 2026 at 9:52=E2=80=AFAM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > The parent pointer in fwnode_get_next_child_node() may not point to a
> > > primary firmware node so update the comments to reflect that.
>
> > > @@ -822,12 +822,12 @@ fwnode_get_next_child_node(const struct fwnode_=
handle *fwnode,
> > >         if (IS_ERR_OR_NULL(parent))
> > >                 return NULL;
> > >
> > > -       /* Try to find a child in primary fwnode */
> > > +       /* Try to find a child in parent */
> >
> > I'm not sure if this comment is still useful after the change, so
> > maybe drop it altogether?
>
> Sounds good.
>
> > >         next =3D fwnode_call_ptr_op(parent, get_next_child_node, chil=
d);
> > >         if (next)
> > >                 return next;
> > >
> > > -       /* When no more children in primary, continue with secondary =
*/
> > > +       /* When no more children in parent, continue with any seconda=
ry */
> >
> > What about
> >
> >   /* Direct children exhausted, go to secondary */
>
> That works, but I think I prefer not rewriting the comment completely,
> and having "any" in there to indicate that we may already be scanning a
> secondary node (in which case parent->secondary is -ENODEV).
>
> So something like:
>
>         /* When no more children, continue with any secondary node */

OK
