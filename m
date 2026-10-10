Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD943C0613
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791603397; cv=none; b=h2ngtzeozgLe/NsFH9fDgRca/Rh7ASkemYXCDiCUOMxOgBkU8qy+0v4I4FKHnfklaxT03r4EHI9t9G8DTRe2/BQFYxZGKgpZI9oC03EVfvFbkI226WeGGJPrMGe0yGTg07p65W0UslCAi+utfhQ4V3I8xVO0dXwpE20OaK6g/to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791603397; c=relaxed/simple;
	bh=59RRrGspd5iUtNZ1bAJjKiLsiHSiAQJ2Y5SqHeIZ5z8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kk7Bt67rd2bf3MIqkXtGjx8Fpj5Z9NzHqvPf56/+dM9XpivR0iC6mNXVYgyRg6o81WhF0ebQNvc2TrnVksxi3VC3zYAgPkUS5ERXYWzUXAqCF+aW7snmC3txK68FKqc/VGcNWBG7+X0qG1YlCzjLbWufvOs18YidfpJh0Olfq/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G58X8FhI; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G58X8FhI"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso494009eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791603394; x=1792208194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M2GB1ttRU2va4gCDaGhpGqvhJfE04jyHCmKo6H7UcmI=;
        b=G58X8FhI1xzxpbOxwe9sYgNID7CzN3dOuZzdQEaBvHC960gBGRzD24X2VK6HQq3Sm7
         ZlXRcMw4R6c0h1gyQpkocAn2oMxdEeAXldMr/i1AeMGfoyU6sPr7OVYnCZUjfmSe5Eni
         8jswRqadq1ky2aYtkanixRgNGqb7ttu8fyp7e0lbgFf2sBebkgfb4lBLTw4/8rzbtdqJ
         hv33M+g//KXHOu0MJQBqmt95BnR2yaimKDBfKTKNCms27zrA+wc1b2pMK+IcPAHS9mB0
         sIrV+rTDQyDqg8p/Bs7adHaTUxzG78rTvibqSW7IuGjBYFab+h8JOwXaKoEHXiQvnPEN
         fmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791603394; x=1792208194;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2GB1ttRU2va4gCDaGhpGqvhJfE04jyHCmKo6H7UcmI=;
        b=kJ+T07bvHA7fsolDtIr70eha13kLvWMhRULm9Z4R6OIt/o1NR8t8Sutz5fHHt5xZ1N
         LemORxr7cJliHsg+ltJ0ohvERX84QQ+1hqmBhoyEqYNngzn1JWOEGKn5H+nJiTCwntW2
         z6lPPi2H8X1xs/Nlbw1tVjsOlUOM+4wBCu9QR0OOtChSlmF5GQYvtlY3en3MqWdoZ1Il
         WBMkSDbgnT4JltYQnSA0A0fwTDDtHtY4dtnRCZN0Wm8hIaRkmBhNasBzpJowyqZH/B4N
         QUdsgTx6Zone7n3K9u9evVdPUNxu7fAAyhzCqztB5tAObO4cVmY6YM21u5d/9zv8Js3/
         wBUg==
X-Forwarded-Encrypted: i=1; AKwUvBzmZv9ml15oz8TwRUU54+NMk3jmiODiiBfv/m1J5KNaoX+Qy7aLPi7UNJIgAy03xN+xCzezWGwNeOOUjv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8ZXX6k16CkBOSCsK5V633ieqyR3/dr8zTPEp1Jl9Oc5uNytSa
	mOcXwhZe9YWQouauYBqk8lqV1xatq5SJd6GX1GXvF09kiPkCXJ8DbWGQXrrec7higgijLo/K2sL
	xyq6BF2kpXiAFirls4CTbRFoW6A==
X-Received: from dyos4.prod.google.com ([2002:a05:7300:6c84:b0:351:5945:17bc])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:6c9e:b0:33c:e82:70c9 with SMTP id 5a478bee46e88-3537e252b4fmr7095741eec.32.1791603393362;
 Fri, 09 Oct 2026 20:36:33 -0700 (PDT)
Date: Sat, 10 Oct 2026 03:36:09 +0000
In-Reply-To: <20261010033630.1171692-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261010033630.1171692-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261010033630.1171692-3-almasrymina@google.com>
Subject: [PATCH net-next v3 2/2] docs: netmem: document netmem and memory
 provider design principles
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Luigi Rizzo <lrizzo@google.com>, "=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add a Design Principles section to Documentation/networking/netmem.rst
covering the netmem_ref abstraction, the prohibition on direct
downcasting in callers, decoupling memory providers from net_iov,
decoupling net_iov from unreadability, delegating provider/type logic to
memory_provider_ops and netmem helpers, and the rule against mixing skb
fragment memory sources.

Cc: Luigi Rizzo <lrizzo@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
v3:
- Collect Reviewed-by/Acked-by tags from Bj=C3=B6rn, Pavel, and Stanislav.
- Clarify item 5: all frags in an skb must either be struct page-backed
  or belong to the same memory provider instance (Pavel Begunkov).
- Link to v2: https://lore.kernel.org/netdev/20261008023030.1089616-1-almas=
rymina@google.com/
v2:
- Document both current implementation status (mp returns net_iov,
  net_iov is unreadable) and target design principles in items 2 & 3,
  and note that new code should generalize existing limitations as much
  as possible (Stanislav Fomichev).
- Link to v1: https://lore.kernel.org/netdev/20261005004958.3603059-1-almas=
rymina@google.com/
---
 Documentation/networking/netmem.rst | 53 +++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/networking/netmem.rst b/Documentation/networking=
/netmem.rst
index 217869d1108dd..6871dcdd700cc 100644
--- a/Documentation/networking/netmem.rst
+++ b/Documentation/networking/netmem.rst
@@ -19,6 +19,59 @@ Benefits of Netmem :
 * Simplified Development: Drivers interact with a consistent API,
   regardless of the underlying memory implementation.
=20
+Design Principles
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Memory providers (or the default ``page_pool`` allocator) allocate underly=
ing
+memory (``struct net_iov`` or ``struct page``), cast it to ``netmem_ref``,=
 and
+supply it to ``page_pool``. The ``page_pool``, drivers, and networking sta=
ck
+operate on ``netmem_ref`` as the abstract type. Existing ``page_pool`` API=
s
+that allocate or free ``struct page`` are legacy compatibility wrappers fo=
r
+drivers that do not yet support ``netmem_ref``. Code that is not yet
+``netmem``-aware should be converted to ``netmem_ref`` unless it will neve=
r
+need to support ``netmem``.
+
+1. **Operate on netmem_ref, do not downcast**: ``page_pool``, drivers, and=
 the
+   core networking stack should deal with ``netmem_ref`` rather than
+   ``struct net_iov`` or ``struct page``. Downcasting ``netmem_ref`` to
+   ``struct net_iov`` or ``struct page`` is not allowed unless a code path
+   strictly cannot function without knowing the underlying memory type (fo=
r
+   example, ``kmap_local_page()``). In those cases, to keep call sites sim=
ple,
+   add a ``netmem`` helper that performs the operation on behalf of the ca=
ller,
+   cleanly handles all ``net_iov`` and ``page`` cases, and returns an erro=
r if
+   the ``netmem`` type cannot support the requested operation.
+
+2. **Decouple memory providers from net_iov**: Memory providers are not
+   architecturally limited to ``struct net_iov``; a memory provider that r=
eturns
+   ``struct page``-backed ``netmem_ref``\ s to upper layers is allowed. To=
day,
+   in-tree memory providers only supply ``struct net_iov`` and some existi=
ng
+   code still reflects that limitation, but new code must not assume that =
using
+   a memory provider implies ``net_iov`` memory and should, as much as pos=
sible,
+   generalize existing limitations to match the design principles.
+
+3. **Decouple net_iov from unreadability**: ``struct net_iov`` is flexible=
 and
+   has no inherent restrictions; it may represent either CPU-readable or
+   unreadable memory. Today, in-tree ``net_iov`` implementations are unrea=
dable
+   by the CPU (``netmem_address()`` returns ``NULL``) and some existing co=
de
+   still reflects that limitation, but new code must not assume ``net_iov`=
`
+   implies unreadable memory (check readability via ``netmem_address()`` o=
r
+   ``skb_frags_readable()`` instead) and should, as much as possible, gene=
ralize
+   existing limitations to match the design principles.
+
+4. **Delegate complexity to the lowest layer**: Each layer must respect it=
s
+   abstraction boundary. ``page_pool`` must not implement per-memory-provi=
der
+   custom logic in its main code; instead, it delegates provider-specific
+   handling to ``struct memory_provider_ops``. Similarly, core networking =
code
+   should avoid per-``netmem``-type branching and instead delegate operati=
ons
+   to ``netmem`` helpers that handle the underlying memory type.
+
+5. **Do not mix skb fragment memory sources**: All ``frags[]`` in an
+   ``sk_buff`` must either be ``struct page``-backed or belong to the same
+   memory provider instance (for example, the same ``devmem`` binding or
+   ``io_uring`` area). Mixing ``struct page`` and memory-provider fragment=
s,
+   or mixing fragments from different memory providers within a single
+   ``sk_buff``, is not allowed (including when coalescing ``sk_buff``\ s).
+
 Driver RX Requirements
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
--=20
2.56.0.385.gd3acb90ef8-goog

