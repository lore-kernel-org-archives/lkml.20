Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EB83F0A92
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338700; cv=pass; b=Hj0gSqjgtgKTfP72+XaNyWfxknqEJiiYmnxUd5dv8I1xvpgSR9LBsfgDFf9hwP4qI7T7mzOm0cjjz6+RjlWkESXVMIiKsIt8MAz04Jdgfsbx9DbIWh+uMHSOMQ3A+U5SawppuiP3akqDgPwV7tEKnRPkBcrISL5hFtF081Uw5Qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338700; c=relaxed/simple;
	bh=v4MRB1p2hWFNpmVvHuw2b2m2RRx7QdZcoW6lu5UUti0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3Kntdt7AlrUHuTNORQFcmmFx1jYBlXu4S4lwY0IGyJ51PbRD3DaXcpmZGh/E31I/PplG2LbFkGKrcj/KxNtE2jUccgzNum29xwVBXr96HpCCh5V4Mgakwo/5EHEJJO3Okg3ZtuL4q3ZxRhtE8FXjywUtNlydTBNv9dMpQNBkLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qJQNIla3; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qJQNIla3"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52fa6005224so6456531cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788338698; cv=none;
        d=google.com; s=arc-20260327;
        b=ENVlDEeBRQ8zD4BC8U8KJZSuvQ7G89oDts9Ij6ep/6wodZOn3ZvFhJI3Z0c4uzJHSL
         eMZ5gS2QhTS3nt1I/b2ziLhXOSN250tt/9/6v+K58YtF/kcCltHmgNju6Tgs0uhbj2gR
         ONwl7JExyDmy+IquRaVKCdkp23ySG85v3ADDxL8YuKDp1pPHsUeIqUIWMHm5Lm3ULZO+
         r8K8/aRxHID7vBt9ks875jQRoRQtRwC9oXx98vFRukb/Hq6Kt07IC3+rUukUlzv6DhEC
         yIgsys3Lz1wwheYijrvovCFi5shr3XTrvisNDamE3qLfl0Fo1defV1buYQkHq3t3S/pr
         b+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xzyWfT7ew/NycVb9UMPTjnv3tdDDvf4cVdFu32Xg2K0=;
        fh=kOw/2kEsQa/RO/KazphYsURxsDg9svCfq7yDxjNXsyc=;
        b=nmzFR0UeOcEc68Rib2c6GnKyC/j0W6BgpFWBXvm8kNIoMUtvQqUj8PrklpWAacVPX2
         iqHgN3B6JQpegKa5t2pVRbfAp0y/wmk5uPIZvW5SRGYg60nVPZHHvd4xXA6vq9nVA9Vc
         Gwv6C+BdQfokv5ueYn1hNgG/xfnllX+npu+7XV8RhU4/9hZxfQCvgaqQJai2hFZRj3wS
         oNh1OziCAXlcAhIMKarDZVD/h4MUqo5eiLwrIztWjZMw4q/PLQlYdCjEZWgOJeJ8CMTZ
         XGiRnfOYHo0Kn7kDQTwn3EvJRNqWdMn7Uec5B2sT3EBeTMJceOEBHDjyK95lJIvNQgYL
         l9MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788338698; x=1788943498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xzyWfT7ew/NycVb9UMPTjnv3tdDDvf4cVdFu32Xg2K0=;
        b=qJQNIla3PaG1/LSsqs9UsbNJXundtwdHHIH4Dq1M8VTYbqa1jJcAjRQym9huLFbSi9
         nNblhSXlX00yldE7ClPEUf0LWre1nLR5FRlryWPsOzjIUQ0oIOwuA8Dba5kFt010jPeh
         1muEulwzFKQ5p80F49ADq8k1MRsOPAbfz0kDsgYUPrnYRoyvtsUapQbtIhd+Y66zZf4T
         JyRHGHypecy+plkQn3UBPRk089ayKvysSPnyTSjg8pN0p+VtnF/23aYRBG2CVw5U4k1E
         tt8MB6cOlIohdnSuKI+MhIKQvxBYby5v82y80cfc6CbUCNKt5QAzTehOP5D/DlxoaDTc
         THxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338698; x=1788943498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzyWfT7ew/NycVb9UMPTjnv3tdDDvf4cVdFu32Xg2K0=;
        b=ruJhZ/iQVbuWTjUqSmeqYjGhydJidzjc/0f9NxHhS3Ql4aE1qOQSaPT636e7yNxocA
         t83ElGC3GuTr9KRf4vf2x40okqu56vj+TY0jCy2BZM0i+Lb557RN/ygys0Csr5uMhqxX
         9wG2pgqfHUncRBBiya1YGZ5OXFB4led0NLIbfd7w5KY0NA92gBz7waWzH9bMY7/eEAK2
         KU8yo6BdAcZIMLqHYgHFZKgk1m9bSCGlIglMFvKwK7dhazsCXZp6p2AnxUnFymjs/BWT
         U0rkiJUUinSQXbLYQAwyeV30rYG7IYC3MPJ3M9gBsdNoRb3i8ze7scnq7uGhm8rxhd27
         3erA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2mT7t7tVRZ1QLI+4UtWaVsTgkUCOHSx0qz0Ptq50B7BJ4MAP3ieU83ybmOzQESMrIOOnZoBVZytLLFbA=@vger.kernel.org
X-Gm-Message-State: AFuF++kFxrBVQAHUtMtMLwkS2IWKj59PHrx9l00LdGT6vg/2m/bKT68c
	iNq+Yucoyi+Qa5ZNVLp6wvqZ4784711V8pS5yCsZASLav9O3/LhAY+MQP0Z5jkHNEFAvQKaGjpr
	ZJs4tCP98lceBBXZF8mtSqcBFLL5vgEAf+uYEHpsf
X-Gm-Gg: AR+sD10FJk9YymElG9hEomo2Mn6VUTzEOrZ+lxIGQQXT/Lnf/29mN9DEAgvp7at64y7
	yrZpyTsXu009X1xA/YUdvxpaT3cY4+clmjN5DtahrL5U/cfDU5+nAIemXoQXM0oz4xg7OrGSqGq
	J0gWQBmYYwtYqizL/nbDsmFcHxHZPGjocT/Cwm55TfFoWoDL2xfIP5FJiSbtpp3Msvk1Wu1dD51
	8+hh4zJMjeimhyZRhGcm9pTkD6wcpVs/fKTJvMMN9pRV4VbGD9AcQph1phrwYv+z4jnvkab1ne6
	IKUYNTGqVB8AlNEXOlpqs/5t2n9MALZl1lyzQjyK7t7mRKk8URSZwuKKfNJVGyfEQ1Cxnp7GUkP
	g2K3Cr0mKINZy4g8Gi2Q5fHhXiVwToqMc4o3jyk7MMJOYHl3RClFA6/vZMQ==
X-Received: by 2002:ac8:598e:0:b0:52f:ade1:2d51 with SMTP id
 d75a77b69052e-53036b97a93mr29500621cf.6.1788338696891; Wed, 02 Sep 2026
 01:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902055802.3724915-1-4ncienth@gmail.com>
In-Reply-To: <20260902055802.3724915-1-4ncienth@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 2 Sep 2026 10:44:45 +0200
X-Gm-Features: AcwNN1VKboGdexVUlpFAdEHrTx2cXb-Shw_ym6hXEYwYsfRpzy1in4WrjdqteO0
Message-ID: <CANn89i+CSVHtjDk_NQT_Q6NpwJ76WQ=CExXp1xY15iPQuZSp+w@mail.gmail.com>
Subject: Re: [PATCH net v3] ip: validate options before echoing them
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 7:58=E2=80=AFAM Daehyeon Ko <4ncienth@gmail.com> wro=
te:
>
> IPv4 option metadata stores absolute offsets from the network header in t=
he
> skb control block. That metadata is only safe to use while it still
> describes the header at skb_network_header().
>
> This invariant can be broken in more than one way. An IPv6 UDP packet can
> remain queued while IPV6_ADDRFORM converts its socket to IPv4, after whic=
h
> IP_RETOPTS interprets inet6_skb_parm as inet_skb_parm. Also,
> ipmr_cache_report() retains the control block when it builds a PIM
> register whole-packet report, but pushes a new 20-byte header without
> recompiling the option offsets.
>
> In the latter case, a Record-Route offset of 20 points at the original IP=
v4
> header after the push. __ip_options_echo() then reads the original TOS
> byte as the option length. KASAN reported a 212-byte write into the 40-by=
te
> stack option-data area on three fresh boots.
>
> __ip_options_echo() currently trusts both the compiled offsets and the
> length bytes found at those offsets. Its fixed-size callers reserve 40
> bytes for option data, while the TCP caller allocates only sopt->optlen
> bytes.
>
> Require the compiled option length to match the current IPv4 header, and
> validate each option's offset, kind, minimum length, source span, and
> remaining destination capacity before copying it. Use sopt->optlen as the
> destination bound so the validation also covers the smaller TCP allocatio=
n.
>
> Keep this check local to option echoing. Rejecting every SOL_IP cmsg base=
d
> on the current network-header version drops supported metadata, including
> the physical egress IP_PKTINFO on IPv4 TX timestamps taken after IPv6
> tunnel encapsulation.
>
> With this change, the original IPV6_ADDRFORM input and the PIM register-v=
if
> input were KASAN-clean. The latter returned MSG_CTRUNC on three fresh
> boots, a normal IPv4 Record-Route IP_RETOPTS cmsg was preserved, and
> tunneled TX timestamp IP_PKTINFO was restored.
>
> Queued IPv6 payloads can still be returned with bounded but incorrect IPv=
4
> peer or error-queue address metadata after IPV6_ADDRFORM. This change onl=
y
> establishes the memory-safety invariant required by option echoing.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Closes: https://lore.kernel.org/r/20260825221922.85651-1-4ncienth@gmail.c=
om
> Link: https://lore.kernel.org/r/20260829144847.1738294-1-4ncienth@gmail.c=
om
> Link: https://lore.kernel.org/r/20260901141352.236286-1-pabeni@redhat.com
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>

Oh well. Ai reviews will probably raise many bugs in this patch :/

ipmr_cache_report() is a distinct bug and needs its own one liner fix.

When ipmr_cache_report() builds an IGMPMSG_WHOLEPKT or IGMPMSG_WRVIFWHOLE
report, it reallocates headroom and pushes a 20-byte iphdr with ihl =3D 5, =
but
inherits pkt->cb with stale IPCB(skb)->opt offsets.
Even if __ip_options_echo() rejects it, ip_cmsg_recv_opts() will still read
stale IPCB(skb)->opt.optlen bytes from ip_hdr(skb) + 1 and leak packet data
as IP_RECVOPTS.
ipmr_cache_report() must clear IPCB(skb)->opt (or memset IPCB(skb)) when
prepending the report header.

Something like:

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index e5f2b1c6150d2f6b2084c2ebaef6047db869cc87..72f1d620b8760722f805935d029=
9bac24a9f720c
100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -1102,6 +1102,7 @@ static int ipmr_cache_report(const struct mr_table *m=
rt,
                ip_hdr(skb)->ihl =3D sizeof(struct iphdr) >> 2;
                ip_hdr(skb)->tot_len =3D htons(ntohs(ip_hdr(pkt)->tot_len) =
+
                                             sizeof(struct iphdr));
+               memset(&IPCB(skb)->opt, 0, sizeof(IPCB(skb)->opt));
        } else {
                /* Copy the IP header */
                skb_set_network_header(skb, skb->len);

Then the  IPV6_ADDRFORM problem must be dealt without adding defensive
programming in net/ipv4/ip_options.c
