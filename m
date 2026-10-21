Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792621094;
	b=pghsV4L7Mxxp+MRuxnExZSGUDc4URznq29rvIcXpXMmC7Z5T1grKFpm6z7xCO3QxqwUD
	 JnEc37GoogLzvslPQp9AMDoroyDC9amCjIHzTHbHA9Tkuz7a8fKNPGNz9tU7mvQkDelA2
	 oi152CqX4tkKy2oQxnnXuUKT/ZVUBB+/mhLuaj7WqHq3ENjtbfO5S8LyaIvF8PPjsHUHa
	 0DktoXvLVTsp0LDve3olSEfzMlNEEcOzhWCStj1qoR8UGmxrSjBpAlTT1t7Y6InWcWHfV
	 1E4zFs/336PJM3Xg4OerPHxv1gsszd4f/2LNpua9kKNmBuqV4n8wWW4PGp7xR+PIYpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792621094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version;
	bh=e9a0WZJQZGzq0hJzVGjFD3PS87eP7CJPfQ93j8ZKwqc=;
	b=Z3ZH4aJoPEt5ntpk5Uv8ecGf6yRp+cljVLnaI9lXuQVz9R7zptzfMi1TvEDIvEvSHiya
	 FeBjKTqbVnT5Ag6ijEbAD574icAeea41/X3iWekWsXIdQfTb+1JoMYt5ucxzxmDu4ojzC
	 H/ZDKFdZxn+uqsq23zINAiZ59vUkGTNeyQLlzgUMdNdQtAnQoxnmppzM3D7AcxsfPtTqm
	 wI7bq0m0SUHw6+u72vzL1AitaS8ilUU6n/beQjY+cdpyHxR95Mumpw9o+OAWM2m06Jz1F
	 VIe/vh6Me6z6zmOIk9BhLepIrfCgM0uyi3PexxHoHCbcBuoHd6q0Muc0FtjWQef9XXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=hl6rBSvx;
	arc=fail smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32198606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32198606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=hl6rBSvx
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LLEfkX2744120
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:18:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=e9a0WZJQZGzq0hJzVGjFD3PS87eP7CJPfQ93j
	8ZKwqc=; b=hl6rBSvxMeq8+98xTN4ebYhJn+jda/c7jxwYRKq/vmwKBCqLEFHpF
	JXKdeVTwTtemvmnlzEx1peNH5KqRs0GczZA1m+5RjjWjJJjsSCVuTwusHuYvtvZR
	qPZv9Yg/9aWd7uknedlIWvCF2hS1fzxj7hqFk2P6HZhfXqNGRrIWfyc7ZbsxQV/d
	5J0fs/mlIFBHSZceRgETILCFVaCyHmZNGCHtdcgwwt6iffDUTQXo6Q1RMX9KajpT
	RBtk40TxUiP+N58PKJlquOKfYWYQwF7KVyH+//KHOUh+Ko0Y9LXXchSDs6lLvUMa
	vdU6zyW0VxpcQuK44XGJnXnipWkwxFPOw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hf45b14at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:18:11 -0700 (PDT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so949012b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792621091; cv=none;
        d=google.com; s=arc-20260327;
        b=RNu6EeLIK7ZsJLIWlCiUdNQKEQkM1VjHZyLLKhsWK+Ft+XNIOxAJ+S7f7sGKg8o8gi
         kgUIvw/BNbUPNCQ4FfOOKkkO/sJ13iqHsPzvUaSZLhuC9uOT8IffBHbsaHTlejM3pqXv
         YWCO4kKqP07CNWi/pADcKj/Vm5e+jFqft8l6p/VnNsYMKOJJk8OFh4ejzhE4ifgzcZU4
         I298hr34ju4vPjDruPl+fnlYV8EjOXd1WYdOanA71zlac7bxgfXiNhq0fqNdtHroq1mA
         hTNLvjOls4NUuTjnyRcHDsoHqze0tqxF6tdstW3Os7rtLu4G0omhHXusxJyJKv+uotdP
         KYvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=idf8AtLSP3kQjHM4bosdvMYQUhX3daN1IRuhmi0WboU=;
        fh=OAqwoH9AAUe3r1NLObKU+TAT5HT7Bo/9zp1y1o4QdFo=;
        b=mPMJv9zqLgU2Bc+NMmFd9J75Vcope5/JxC6EpFvVbYyLesNn23OokBkyZGBXIlAwLX
         wApJ1VQtUee/ND56+A1E34NSLi0REZQlllB/olKEbwkREYdFXQdcPb9OPRqVFe7F5vLv
         SJhXSxvvCVAYqbmyw7/+6+vUpw2Zh/Na9MBVxCJ/skE3WipGQmZ7LGpR/ssdbZIJcvBx
         562o5WPsgaqsIIPFTlOyLGoi74VAPJS3bxvNGxqLPYvpUShSHld7KSzPP/jSOUecjZ2r
         yu036VOKPBKxSK4aMXJ/f14CJQKPkvop9aixZP8f4mmV0ZPLaLAaaGxwlqPSOrOzDAdb
         s6/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792621091; x=1793225891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idf8AtLSP3kQjHM4bosdvMYQUhX3daN1IRuhmi0WboU=;
        b=n2MOVqL5EablLrCJxoDoKwpIkTAWSWJV43gMQ8kj1xyT02lOX0C0g6kgVdkKKquhyC
         cT3HoLP6uFQOgpOMYAHHepWBBMd4eD0jreYcA7rfwcuA8MnKASMdgwePDWj4OP0JRg28
         MoDhhkebQn26I2cPH0cY296VNYKAIizVl4UDR64k/o6YHS7XAvEr0Kr5q6+DzWXWxF6S
         T7115ZlLSEdPmkn9ycFooB1AwKJxmfrLMuE58ZGudjSBTh1lxraJON9IxDyWfIjBEwZo
         jdJgmMzHBHym1XGKCLMc97yPE1YQRPuB50vnNOgIUT7n2a9boGuLD+nX7Zryv5QO44C7
         s5vw==
X-Forwarded-Encrypted: i=1; AKwUvBzCfft9QJGICKlIwXzWUnTBbU/BGc9QNCtf3plYalV9v+MxeZa1JHUR9pokeODacWMAeapHNrgD3jj1YZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3n7wPBL3TD9FG0d7sZcErZhDYkoOZMDXVvrngX4+pFWBuKCrh
	enUofVWfxGXyje8EOdwwHj0TK74vp3I4WrMYVx0kKavFhTZ5vVe2IkMX2Pob1cwoZaLy3pN80lp
	4lBUkB+1SsmVhumHrb4mIlylMyNe4F56jhcLZ7t9V23QHqb4LLa+4wec94Ms+NlqIqsaEuX6o6c
	PfLfjQqzRwnnyXe1YB+NjziXGsjW3hU5jl1q5M31tIzGA9JrgCYg==
X-Gm-Gg: AYBFou3lvU6fEuW0Eshj8IplCTLtJHSnmBCWjvCYZPvGA8qKRSmzrTrjMabu3pNoaHT
	Vp6vamHpIJCAMYMMLt3U3qn8uNCOWthtoTEpPkGClGmrYc0zpZ107A8bxaTqHXT9KpIJ7+9QXFj
	4mSkueYTMQlPwFSIauylRBWznFAG72Q2VLWbmlImR07kYquQ3itkVWWL7XfYKgA32etJ2OX/CK
X-Received: by 2002:a05:6a21:3298:b0:3de:55ce:75d1 with SMTP id adf61e73a8af0-3e287f24260mr2248662637.92.1792621090819;
        Wed, 21 Oct 2026 15:18:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:3298:b0:3de:55ce:75d1 with SMTP id
 adf61e73a8af0-3e287f24260mr2248651637.92.1792621090227; Wed, 21 Oct 2026
 15:18:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAN8mxQpCCO3QNXb0pimRsNqfLs1qS0epZmB59q2sd8QCLhgOpA@mail.gmail.com>
 <atktw9TRy0UKsjOB@hallyn.com>
In-Reply-To: <atktw9TRy0UKsjOB@hallyn.com>
From: Nik Tsytsarkin <nikt@meta.com>
Date: Wed, 21 Oct 2026 17:17:57 -0500
X-Gm-Features: AclHuK_FmF8e4Nxgjg7RySBj9bMAc8OT_WI0hCCAv0C3KXFQMXGtnMgXjmuwkbw
Message-ID: <CAN8mxQo+NtJ7AqY01j4R+HrN-=fU_SdpbSypC3sEu96FpWnAJg@mail.gmail.com>
Subject: Re: [PATCH] apparmor: fix NULL peer label deref for connected
 SOCK_DGRAM sockets
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: John Johansen <john.johansen@canonical.com>,
        Georgia Garcia <georgia.garcia@canonical.com>,
        Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sam Dlinn <sledge@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4OCBTYWx0ZWRfX3up8Rkl9zqqI
 deBYu/K4Nfau2cKkbrsdtTKEWym1HE/gy7k45pjwIyshGeCAXzSfUdKqmbtlynAVcyJ7cPk1YgZ
 nTlYCZ6Ld2XqbA1UYjx8/ZINdGytFXMemRmKJyPl7/BvauxooHMISvQGK9Yj8V3mSfwlY6B7YQg
 wBmGI/7w0Oe1gDMjvpiHFKS4IVX7QmN+3fYlj8+WY6IOyN+CE6kCciPKz2tsLUypCzbLGNat744
 caYtaN/IKs4p6VOCWwHeOFhBLLi0ZmpwYl4xasKS+RHXOhxDHMlipt4APWKS1NpX40OeEoAPX0e
 Rwdd9YhR0mXHWsO3LrpwqI+oLiTU/dyrLqTC0nEvcKyrNp1ixAh48+Ikbvg8E7bJPhw9qUD4uKR
 gtc2R60Xfl3tJvm30N7buKUOkP7wdnow/eKE8isZoaN1UXXNKGXahujmjE8PsVJnwein7Btt9UC
 Zo7K3y/9kELgyXqZFug==
X-Proofpoint-ORIG-GUID: KO2DbkCOQOlotQN0FvUjDaDoJJytR-hw
X-Authority-Analysis: v=2.4 cv=TdQDJhQh c=1 sm=1 tr=0 ts=6ad93a23 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=jCddH8ec0KUNCymVuxII:22
 a=VabnemYjAAAA:8 a=hBqU3vQJAAAA:8 a=FOH2dFAWAAAA:8 a=Qfn3z1FVZM52wDHW1jwA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=gKebqoRLp9LExxC7YDUY:22
 a=WLjMIN4s_96MqnBbPenP:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4OCBTYWx0ZWRfXylDOmJepbhPy
 AEiyXqx4Al0ze8J5RhgAlZv2477QfS2JDObpRvPXePuUF7LIq36MmnDo+mPu0jh1vPLUcx2B84F
 SJkAWljlCqUnDwmzSGHlpTsB88Rofj4=
X-Proofpoint-GUID: KO2DbkCOQOlotQN0FvUjDaDoJJytR-hw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01

Sorry, I messed up the brackets while putting my email in into the
signed off field.

From 4ffed66a07d63db409ad272309fe4946ed758360 Mon Sep 17 00:00:00 2001
From: nikt <nikt@meta.com>
Date: Mon, 19 Oct 2026 15:17:33 -0700
Subject: [PATCH] apparmor: fix NULL peer label deref for connected SOCK_DGR=
AM
sockets

apparmor_sk_alloc_security() initializes ctx->peer and
ctx->peer_lastupdate to NULL, and unix_connect_peers() is the only
place they are set. It is called from the unix_stream_connect and
socket_socketpair hooks, but not for SOCK_DGRAM sockets paired with
connect(2): the dgram connect path only goes through the unix_may_send
hook, which does not touch the socket's apparmor context. So after
connect(2) on an AF_UNIX SOCK_DGRAM socket, unix_peer(sk) is set while
ctx->peer stays NULL.

When a confined task later triggers file revalidation on such a
socket (its first write(2) on the fd suffices, with or without a
profile change in between), aa_unix_file_perm() runs the post-check
cache update with peer_sk !=3D NULL and a NULL cached peer label, and
both update paths dereference the NULL label:

- update_peer_ctx() calls aa_label_merge(old, label, ...) with
old =3D=3D NULL, which reads old->size;
- update_sk_ctx() calls aa_label_is_subset(plabel, old) with
old =3D=3D NULL, which reads old->size via
__aa_label_next_not_in_set().

The AA_BUG() NULL assertions in those helpers compile out without
CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS, so production builds oops
under spin_lock(&unix_sk(sk)->lock). An unprivileged confined task
can trigger this whenever its profile mediates unix sockets (complain
mode included). Because the oops happens under the unix sock
spinlock, the dying task then deadlocks against itself in
unix_release_sock() on exit, leaving an unkillable spinning task and
an RCU stall on that CPU (and a full crash with panic_on_oops=3D1).

BUG: kernel NULL pointer dereference, address: 000000000000004c
RIP: 0010:aa_label_merge+0x63/0x730
Call Trace:
aa_unix_file_perm+0x477/0x800
aa_file_perm+0x434/0x550
common_file_perm+0x58/0x150
security_file_permission+0x22/0x50
vfs_write+0x76/0x410
ksys_write+0xb3/0xd0

Treat a NULL cached peer label as "not initialized yet" in both
update helpers: have update_peer_ctx() adopt the checked label
instead of merging with the missing old one, and have update_sk_ctx()
initialize ctx->peer/ctx->peer_lastupdate when no peer label was
recorded. This lazily completes, at first revalidation, the peer
cross-referencing that unix_connect_peers() performs for stream and
socketpair sockets.

Fixes: c05e705812d1 ("apparmor: add fine grained af_unix mediation")
Assisted-by: LLM
Signed-off-by: Nik Tsytsarkin <nikt@meta.com>
---
security/apparmor/af_unix.c | 8 ++++++--
1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
index b908e744818c..e802538b0e54 100644
--- a/security/apparmor/af_unix.c
+++ b/security/apparmor/af_unix.c
@@ -682,7 +682,7 @@ static void update_sk_ctx(struct sock *sk, struct
aa_label *label,
if (old =3D=3D plabel) {
rcu_assign_pointer(ctx->peer_lastupdate,
aa_get_label(plabel));
- } else if (aa_label_is_subset(plabel, old)) {
+ } else if (!old || aa_label_is_subset(plabel, old)) {
rcu_assign_pointer(ctx->peer_lastupdate,
aa_get_label(plabel));
rcu_assign_pointer(ctx->peer, aa_get_label(plabel));
@@ -700,7 +700,11 @@ static void update_peer_ctx(struct sock *sk,
struct aa_sk_ctx *ctx,
spin_lock(&unix_sk(sk)->lock);
old =3D rcu_dereference_protected(ctx->peer,
lockdep_is_held(&unix_sk(sk)->lock));
- l =3D aa_label_merge(old, label, GFP_ATOMIC);
+ if (old)
+ l =3D aa_label_merge(old, label, GFP_ATOMIC);
+ else
+ /* connected dgram socket, peer ctx was never initialized */
+ l =3D aa_get_label(label);
if (l) {
if (l !=3D old) {
rcu_assign_pointer(ctx->peer, l);
--
2.53.0


On Wed, Oct 21, 2026 at 4:25=E2=80=AFPM Serge E. Hallyn <serge@hallyn.com> =
wrote:
>
> >
> On Tue, Oct 20, 2026 at 12:30:41PM -0500, Nik Tsytsarkin wrote:
> > apparmor_sk_alloc_security() initializes ctx->peer and
> > ctx->peer_lastupdate to NULL, and unix_connect_peers() is the only
> > place they are set.  It is called from the unix_stream_connect and
> > socket_socketpair hooks, but not for SOCK_DGRAM sockets paired with
> > connect(2): the dgram connect path only goes through the unix_may_send
> > hook, which does not touch the socket's apparmor context.  So after
> > connect(2) on an AF_UNIX SOCK_DGRAM socket, unix_peer(sk) is set while
> > ctx->peer stays NULL.
> >
> > When a confined task later triggers file revalidation on such a
> > socket (its first write(2) on the fd suffices, with or without a
> > profile change in between), aa_unix_file_perm() runs the post-check
> > cache update with peer_sk !=3D NULL and a NULL cached peer label, and
> > both update paths dereference the NULL label:
> >
> >   - update_peer_ctx() calls aa_label_merge(old, label, ...) with
> >     old =3D=3D NULL, which reads old->size;
> >   - update_sk_ctx() calls aa_label_is_subset(plabel, old) with
> >     old =3D=3D NULL, which reads old->size via
> >     __aa_label_next_not_in_set().
> >
> > The AA_BUG() NULL assertions in those helpers compile out without
> > CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS, so production builds oops
> > under spin_lock(&unix_sk(sk)->lock).  An unprivileged confined task
> > can trigger this whenever its profile mediates unix sockets (complain
> > mode included).  Because the oops happens under the unix sock
> > spinlock, the dying task then deadlocks against itself in
> > unix_release_sock() on exit, leaving an unkillable spinning task and
> > an RCU stall on that CPU (and a full crash with panic_on_oops=3D1).
> >
> >   BUG: kernel NULL pointer dereference, address: 000000000000004c
> >   RIP: 0010:aa_label_merge+0x63/0x730
> >   Call Trace:
> >    aa_unix_file_perm+0x477/0x800
> >    aa_file_perm+0x434/0x550
> >    common_file_perm+0x58/0x150
> >    security_file_permission+0x22/0x50
> >    vfs_write+0x76/0x410
> >    ksys_write+0xb3/0xd0
> >
> > Treat a NULL cached peer label as "not initialized yet" in both
> > update helpers: have update_peer_ctx() adopt the checked label
> > instead of merging with the missing old one, and have update_sk_ctx()
> > initialize ctx->peer/ctx->peer_lastupdate when no peer label was
> > recorded.  This lazily completes, at first revalidation, the peer
> > cross-referencing that unix_connect_peers() performs for stream and
> > socketpair sockets.
> >
> > Fixes: c05e705812d1 ("apparmor: add fine grained af_unix mediation")
> > Assisted-by: LLM
>
> How did you generate this patch?  (It looks damaged.)
>
> > Signed-off-by: Nik Tsytsarkin (nikt@fb.com)
> > ---
> >  security/apparmor/af_unix.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
> > index b908e744818c..e802538b0e54 100644
> > --- a/security/apparmor/af_unix.c
> > +++ b/security/apparmor/af_unix.c
> > @@ -682,7 +682,7 @@ static void update_sk_ctx(struct sock *sk, struct
> > aa_label *label,
> >   if (old =3D=3D plabel) {
> >   rcu_assign_pointer(ctx->peer_lastupdate,
> >     aa_get_label(plabel));
> > - } else if (aa_label_is_subset(plabel, old)) {
> > + } else if (!old || aa_label_is_subset(plabel, old)) {
> >   rcu_assign_pointer(ctx->peer_lastupdate,
> >     aa_get_label(plabel));
> >   rcu_assign_pointer(ctx->peer, aa_get_label(plabel));
> > @@ -700,7 +700,11 @@ static void update_peer_ctx(struct sock *sk,
> > struct aa_sk_ctx *ctx,
> >   spin_lock(&unix_sk(sk)->lock);
> >   old =3D rcu_dereference_protected(ctx->peer,
> >   lockdep_is_held(&unix_sk(sk)->lock));
> > - l =3D aa_label_merge(old, label, GFP_ATOMIC);
> > + if (old)
> > + l =3D aa_label_merge(old, label, GFP_ATOMIC);
> > + else
> > + /* connected dgram socket, peer ctx was never initialized */
> > + l =3D aa_get_label(label);
> >   if (l) {
> >   if (l !=3D old) {
> >   rcu_assign_pointer(ctx->peer, l);
> > --
