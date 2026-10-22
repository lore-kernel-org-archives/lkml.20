Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646451;
	b=xc5xqn9GuneqaKtCzq0iEirRDQdfyeA/+B6++namcIr0JQ3KREDnYIbtyDWaMNt9yqXS
	 ELhFcB9vtlsJ1Ok5EO00aQLxnXD6m/cQDdCmqFXvC6mRJiBHGKCKApOC4CesJK2jzg3vJ
	 yuDVfi75QkdRrf7wl7ant71jPyS7W96Ck6Vifiy10VUfmSAjtk1uQNRJkst9u0MNJlbV7
	 jwCxaztldAxJcEBH2+SU8I0ZLOJ4qBqAHhy7oYmJsognu/ppVkBWN046yoRthwWfDuPYi
	 S0ik6RNgZmXgjid0Zln7NB5KO4eLGaxLgTJFzIRRqTsDTmRt8R9cp0wutO6xhTgvIcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646451;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:In-reply-to:References:Date:Message-id:Reply-To;
	bh=C6YChKu6whRjoZC1U69Tr/daamYf8mLwnwnAYD8eieI=;
	b=zwjRgsNiavHLp/1m/NWc7rB0AxgGobfDF6BbCkt+8EH2PeunM+X03Mhi19xmJ4krF78n
	 0n/NmC9KoQ+kHPd/BXRe9e/3REy9fcyyHLcgIkhzapxwKMVcidQUFvANx0WhwQCnyYi6X
	 z4VQRfh9pIxXLHw//KtcYoTvW1ixS2JDQh6BSoeCCVP2STcDkxGSUCS2bcTr+qwFOi5Nh
	 pDVLdNRUEErbblGeKZSLr9MO5jDi0GdwdY5E5I7DVcs2sY2NLkpmiviOIxxK4IH165IYe
	 fPY2xifpLtcwWt6rZeADfNOdzgPLbHK471nbY90T73wcK6QuYXT603w2EDn4zF8fXEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=RSCGlCJF;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="sYbaE/gK";
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A3B606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A3B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=RSCGlCJF;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=sYbaE/gK
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E6A8614001C7
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:20:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 22 Oct 2026 01:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
	1792646449; x=1792732849; bh=C6YChKu6whRjoZC1U69Tr/daamYf8mLwnwn
	AYD8eieI=; b=RSCGlCJFuzKPJ6S+8v8KeEHvwEewLc9Wf1Bb8C452R133WgppFK
	W1Pu710BOYB+P5X9Fpdwbt+udq1ZBdJisc/lKy2T97oBwjU/0jJKSiRNA9u8zYuq
	q92F/GPMl9LyPCbNWNlCtWVA9nOPCgryIRElKpfmeRc6eNlrRsxGt0yOwq+lYNje
	5DzGcwbe3ueKDNyaY330St6PCVFsRid384Ygq/NcYkm5zA3obTTC9gkyZvX9cVzU
	Z201Qz+RNqQ9o4WaRlH9fMGRlJMt2wdvLtoO6HefX+m0dvqTCr9ZKtwSMyWPBrML
	4V0N5toQmnKnokJdNKt/sU235UXltnTTbgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792646449; x=
	1792732849; bh=C6YChKu6whRjoZC1U69Tr/daamYf8mLwnwnAYD8eieI=; b=s
	YbaE/gK3l4FixwhHalRHkNtjDN0wfzVlFmIGq1d2TSd3QyUV8Cx1+F9M4UL2kVJk
	qm9eJr/vJRrAtlB28vlgRRxt5bHZiGPXFdzA647lhjRQnCY7NSSAF2s+N7ZZgwG2
	G3XBk/NMx186upyTOUn14Td6BXYuBVzM6B2M0JJd7/+l1YlWXksKPEeAOQMbWTH7
	bB/axWJ/rHO253E1Zj6VHzOOerqUKrfEk6PUdzeuOh43LBiGo36SgiNNixn5SHSm
	9HivR16tlrRZvKVB3HgC0zwUMTQmzjfPg2jidjs4IlRc0BxORlxVaQMXoiTTfse1
	awH93WzFOrgrn3fsCVNhQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792646449; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:ZMl8WQuUaDe7/X0NKOK1CWiVdoCooSS7Kj0x7NOyrcKtVx3
	Kdx0T2532BDBKYUhifs9UePFPKue9/Ac8pNEsvGj/Zjw8WtPmmJbhbxeoj8Pe8ne
	UCGGLDtzAxBelxrCTxwtB/P0mE3okRpyVrj3MemncHVEeIkFdiyLxeLWICwrNK20
	Z12txQTJzEEUHPlQUFb+FUy02ukhI0Ad3/wW9OrXtbiIAzqpGCvWZVhH7lToNx2u
	CkPZWw5ENNBsrfWOiXAH6IcD0s6Nx2m8nWY04z5e6dQB4L5RaHnObgDcCraVS1X0
	17uEgFfVOVVind2F0TuH8+x7UY6ts+s3rMKzznQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:zCeJv1oSa/FXffmdS3DaYAv46VkeiwFxZsbn3o9NEnA=:Ni8lHN7obetJJcbnzWLnxjIbJtuffAppjJm7oFJiaX4=;
X-ME-Sender: <xms:MZ3ZavdKotuPGMxGS4i38JCx37KAxiF5vA8fjclNu5WrUj6xRuxYLA>
    <xme:MZ3Zany129PAMB12uzzz_MwY3Q2tYQ8JYGJ0pu6dweIOBjktdjljdSeXPPw1vgJh2
    VpmaGky5DqnyJ-tUFr1LwRSVFOk57bK8OSyyyKQqtOBK2CM>
X-ME-Received: <xmr:MZ3ZasKCB_dU5uTfN1_dxb3Jrbqos1_ZDYPnSaTjZd9pqDwMvlYVbLHfNYiSJnFmGmBAsTqrnFx7cOUz54l0UIh6M_IrwvY>
X-ME-Proxy-Cause: dmFkZTFWFAlgsGMpytjkPGmeM6d3e27AzhhHijeP8GQWhjVC5jRjKlEFBVZg1fQV5SEt0h
    d5ZG5Zlco5makfByakQwEn2HkcVEBuJ/Cqz4ue3AzlnavwJU+rWDxLsf8nFZpJI7BOtYnc
    b/mmpixdb7wSKQmOhPxZmmsPn6h75Mnh3OQSgy982S4vkwweC+34Y78mwZPIoRE/F4X3qF
    NCE40k8UPXjTXuNHkxKyg+TX5ciqNotkFXDKDSQr52kXdmxHQSPKeE+17+MYQCSc7f0BBh
    GKuOLHbDcRneOPlHgxqxTwO/5M2Xm4mRsjy4Dwhrie7Ed4S3RcP67t6Ti9+N40X3ELLqYk
    /U/KMCq2GisM6zxKMsVBFd6+PoG8ccfi6cjmYoy4hZt0UgVEmXUCk64mjZEg109CHbLEh9
    Y/aG84PTCcyOQssnQm10Pj1d48pR/OUMpjx1ZsoQl0DyyhNFARVW9xftalE93omSpf1mNG
    I+cRBZcqRcR7aLbR4J1F74i86yK4AG5oYVVdLu13x2gWsj2KbXGwixJr1cOc7EIDWPCHtz
    f38OxQKktrTkwjQV8bxiKBbNIIzyfXZ+Fy8l8mjheNHCQXH6UkMa0PgsoE1LEninEFnT5w
    zlxvS7oE0ndso0tqWVijat4MYzKdtffLlWyRuEPo8WRrggbiCXUyolwZlfLw
X-ME-Proxy: <xmx:MZ3ZahGuEcKCdyQpOqVcl3zI4Eit2Gk8YlZ6ee9t_FrCSiXYXdda5Q>
    <xmx:MZ3Zag-TFjutNoGgzzPpZK0JDDG6Lt4QjkTsatXuy-6UUqV4He7w1Q>
    <xmx:MZ3ZapLNMRZHH44e4_YyGQ64qe0I-Nm09sFbblIRwCWaDQ9opQgtXg>
    <xmx:MZ3ZamuvhBmogwhtJlRJFovHa3Q4QL7T1otfhJpbSwpJ0vGKus3Jkw>
    <xmx:MZ3ZatPkc84RqRW46l1jDAVGYlju3lsy_x7y3iEexAQ5hludri1bMnEE>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Oct 2026 01:20:47 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Ian Kent" <raven@themaw.net>
Cc: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.cz>,
 "Amir Goldstein" <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Jake Edge" <jake@lwn.net>
Subject: Re: [PATCH v4 1/5] VFS: don't count references through ->d_parent
In-reply-to: <9fa5947c0e40f629044f22cf5ebbaa9bf3d6d6fd.camel@themaw.net>
References: <20261019000810.1837917-1-neilb@ownmail.net>
  <20261019000810.1837917-2-neilb@ownmail.net>
  <179257644849.1724252.12278532043596915181@noble.neil.brown.name>
  <fc2c9191a50a782fa6560349060ddfd763ec2ab0.camel@themaw.net>
  <9fa5947c0e40f629044f22cf5ebbaa9bf3d6d6fd.camel@themaw.net>
Date: Thu, 22 Oct 2026 16:20:43 +1100
Message-id: <179264644322.1724252.1549706826156439157@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Thu, 22 Oct 2026, Ian Kent wrote:
> On Wed, 2026-10-21 at 19:47 +0800, Ian Kent wrote:
> > On Wed, 2026-10-21 at 20:54 +1100, NeilBrown wrote:
> > > On Mon, 19 Oct 2026, NeilBrown wrote:
> > > > From: NeilBrown <neil@brown.name>
> > > >=20
> > > > The number of negative child dentries that a given dentry can
> > > > have
> > > > is
> > > > effectively unbounded, so counting the references through -
> > > > > d_parent can
> > > > overflow ->d_lockref.count.
> > > >=20
> > > > We only use this count so that we can know when there are no
> > > > remaining
> > > > references including from children.=C2=A0 However most children appear
> > > > on the
> > > > ->d_children list and the few remaining children (inactive
> > > > DCACHE_DENTRY_CURSORs) only exist in a context were a separate
> > > > reference
> > > > is held on the parent.
> > > >=20
> > > > So if we count whether d_children is nonempty (i.e.=C2=A0 dget() when
> > > > it
> > > > becomes non-empty, dput() when it comes empty) and require
> > > > children
> > > > not
> > > > on ->d_children to have a reference on the parent some other way
> > > > (which
> > > > they already do), then ->d_lockref.count will not overflow and we
> > > > can
> > > > still know exactly when all references, including through -
> > > > > d_parent,
> > > > are gone.
> > >=20
> > > sashiko discovered a real bug here as autofs depends on d_count()
> > > including the number of child dentries.=C2=A0 This is easily fixed.
> > Umm ... oops!
> >=20
> > Yes it does but that's purely to establish if there's any additional
> > references held indicating an open file or working directory within
> > the directory although I'm not sure I actually use it for individual
> > directories. The mount reference count changes that Al did some time
> > ago should mean that ino_count can be eliminated and the mount count
> > alone used instead.
>=20
> Ok, so I "do" use this to check if an individual directory is in use
> but your right about it being a straight forward change. All that
> should be needed is special casing empty directories and removing the
> increment/decrement of ->ino_count in ->mkdir() and ->rmdir(). You
> shouldn't need to worry about directories that aren't empty since they
> shouldn't be covered by a mount so autofs won't be looking to expire
> them.

I'd rather make an "obviously correct" transformation, where instead of
assuming d_count(dentry) includes "ino_count", we assume it includes
"ino_count > 1".
i.e.  1 if not-empty, zero if empty.  That is exactly how d_count()
handles children after that patch.

That turned into a longer patch that I hoped because the local variable
"ino_count" which was already misleadingly named, became if more
disconnected from the the actual ino_count.

Below this is what I have.
Thanks,
NeilBrown


--- a/fs/autofs/expire.c
+++ b/fs/autofs/expire.c
@@ -208,15 +208,18 @@ static int autofs_tree_busy(struct vfsmount *mnt,
 			}
 		} else {
 			struct autofs_info *ino =3D autofs_dentry_ino(p);
-			unsigned int ino_count =3D READ_ONCE(ino->count);
+			unsigned int use_count;
+
+			/* allow for 1 if there are any children */
+			use_count =3D READ_ONCE(ino->count) > 0;
=20
 			/* allow for dget above and top is already dgot */
 			if (p =3D=3D top)
-				ino_count +=3D 2;
+				use_count +=3D 2;
 			else
-				ino_count++;
+				use_count++;
=20
-			if (d_count(p) > ino_count) {
+			if (d_count(p) > use_count) {
 				top_ino->last_used =3D jiffies;
 				dput(p);
 				return 1;
@@ -321,7 +324,7 @@ static struct dentry *should_expire(struct dentry *dentry,
 				    unsigned int how)
 {
 	struct autofs_info *ino =3D autofs_dentry_ino(dentry);
-	unsigned int ino_count;
+	unsigned int use_count;
=20
 	/* No point expiring a pending mount */
 	if (ino->flags & AUTOFS_INF_PENDING)
@@ -375,9 +378,11 @@ static struct dentry *should_expire(struct dentry *dentr=
y,
 	if (!(how & AUTOFS_EXP_LEAVES)) {
 		/* Not a forced expire? */
 		if (!(how & AUTOFS_EXP_FORCED)) {
+			/* dentry has any children? */
+			use_count =3D READ_ONCE(ino->count) > 0;
 			/* ref-walk currently on this dentry? */
-			ino_count =3D READ_ONCE(ino->count) + 1;
-			if (d_count(dentry) > ino_count)
+			use_count +=3D 1;
+			if (d_count(dentry) > use_count)
 				return NULL;
 		}
=20
@@ -392,9 +397,11 @@ static struct dentry *should_expire(struct dentry *dentr=
y,
=20
 		/* Not a forced expire? */
 		if (!(how & AUTOFS_EXP_FORCED)) {
+			/* dentry has any children? */
+			use_count =3D READ_ONCE(ino->count) > 0;
 			/* ref-walk currently on this dentry? */
-			ino_count =3D READ_ONCE(ino->count) + 1;
-			if (d_count(dentry) > ino_count)
+			use_count +=3D 1;
+			if (d_count(dentry) > use_count)
 				return NULL;
 		}
=20
