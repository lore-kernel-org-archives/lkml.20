Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B1B38F95A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365501; cv=pass; b=SM+NFvtAT5oZtOVGgt3db5oxzIXlHk1XY9dmll5go9C9f4mSXw+ZEBlbBpCbcEFMxEHQNfUw8yTxFLaGp9GLHjpa+ds19HY8AO66M3NlfQGqZgXPGyyV3I+pTw4apFH/79OS70BVsIgs/EvcP2eDeOf/4pjtbYt+9zNWplKlyI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365501; c=relaxed/simple;
	bh=Zmmt9hQP1IprfSntclgWhCnCxwGgbeXDBb1lKsaObYw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=L4h/GJTbHcMVAGn++TyI/Qk9ThbghYjViAMJB1N177dPSV3h+orJ1GtirbjUVxzC5eoxpEiVOI0Dt3dlRi1r6VyAQ7TBGdJFZpGhH4b9A04GRlyNeOOKazPhATTlS/MZ3U61BsG5GbmmrOZBrdZ1RcdKP454OAC3NUDKtpXgOQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnlbJ+fA; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnlbJ+fA"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533778ab0bdso16720351cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791365485; cv=none;
        d=google.com; s=arc-20260327;
        b=kUmgXp6qHgbCCCiX/CwSr8U7HO10dKXFnounuS2osRcGbRTENx4US7tpLrafWQXEvy
         43YnRGmxuDRysDbzN1NwLkrpSg3W7oj1A1BJx0nt4oIFDDVJj5TOxppKqNyU/3z5hPIz
         tB2wlyRN7QqNJxWXajT1F3DtzGYXrG7g0WInDTfRtMqMYWGpCStTV31xtC46RM+BSMJc
         C4tDY3EwUU3CWdKMAhsr+dWIceYDH8jCyPMHVZvY+h7G2owdIPBQr+/zx/5cHPubLVJW
         lPoRHlnoKm07EM5pnYKD7sHHimhqNsFobGODat+A1VXAJCxuYRloJJNnDyrNJnqS2sQ1
         sLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=V09DwGBZvmEc/vHeu0R4CYl3zezqyawSgFVLYfPfhBo=;
        fh=YnfqTt9m8OG3O7zd1p9Edb8NXXTo+7WGM0mUl47lyp0=;
        b=UBH9/u5hZlNs5E0XZANqzC61VGGEs4txd3BAfn3963d/Nc6yBdbUCSqgAE6RhF/LcY
         Sd4iZMM2tYvVOHVTAYRUIika10NMX4WE4M7a/nJHPC0tfGz9IAjYcYdf4Nn04SG0uPNK
         toddlB62JFEUBQBzwWdG/gF0cbOg/yAs/hkSBgXtAjpEFNM9q3d/W/yUCwMuV0DGIgpU
         8D2kUe0lUCx5FcGLSrRUPQvM2iVW5lBLlSu9LVBlVCxFU7uQRc+yxnZZkhQwgJTt4hQn
         kMohzJWJREjb1REMnId+5ts8Za9nGJF2NF1jP6VIoE1UELp7h6ohZv/hswHjlYkhK1S8
         xMeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791365485; x=1791970285; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V09DwGBZvmEc/vHeu0R4CYl3zezqyawSgFVLYfPfhBo=;
        b=nnlbJ+fA3ssxq7ItDvYtPpxSrRJuHMQF3Iz3SPvSGFerzbtLhtpue/fTYQO5BLAIit
         gieLRn5KryMSIX7dIF+YWRxqnDAZmePGjCbU2xV52uIqHHW/J4r/YXbetAyNoC/Oy9nB
         Pd6H/7yjXlO9hJ+vWFoPOIgJRCrdvh/N2T3F+Xb0fV5DIDwsyBIXxVfDyyXKTUiv4KQG
         sVfoIW0+0cxSJlBKs01swUdGanmv9QLOlBAtFdQOnu3OmB5KATD7pwBdGxhSA9raJrKu
         Em3G1nLTblGyCDShcmQB6JRbSH6nM3ZgBvJv2z9WjcEcElIPwOXmeEitYz8zHqz0n4+G
         XaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365485; x=1791970285;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V09DwGBZvmEc/vHeu0R4CYl3zezqyawSgFVLYfPfhBo=;
        b=XB4azsCTZWUsyrg2aRZ0mQ+xCQd9x85/KAnbiveXrRICraNWypWtNy0F8+vfC4QP4g
         o8w4e3pJzqQvaWv5fkBqQxNwo0APy2fd4YttuIpCcLxL2KKVtW0TE3058tzFyNWa2i7T
         2YeP4htqPwoB82/tO0FgMVaD5XIVDbJFxfFpRhn5vG0vnPMmce4U+E27ZtPEWapCKUXV
         ouFwW6GwN6hocJmdx4i5PeMMG85I+w6wG1Wl8KXtPVi0YAvXJMF4MYD9yzriyQUbVkYf
         k2/vbTH1GIGvth+vEV3A29XaI6PwjkVyXagf49pvnnsQlUUKkdil49G9bW+cD8KAnCML
         0kCQ==
X-Gm-Message-State: AFuF++m0gmAbMuZbmtrtp6lIgtJGEJY4E8KhfQ4d2We9i702UV8FTRUB
	uyNL8Rnct7BK5DFVIPYTT4wWU9bIkQrkZA7v1mk+1yt8Elwhhq0oMLOT9dbCv7MT26Fk6H9J1D5
	6WvvhCuWb1dgngW50mXsyB23tnW8Au8Q1JT4bL+A=
X-Gm-Gg: AYBFou33/aSeKVO9Czgrn8cbEKXoJfQDQt+L1fqwO5eK/HSDDGtnwgBpH1oIofv8kEC
	+iEIfEnHQ4YuMARgUctO5zfY2D6VAKkKwTJEBGOXjpWc06TF0Ntw/kk0YvFe1n+k2gl+IjvShWh
	a23rzKPGK4Mfbp+1WZ0ktgMj5PBtGNw7goZyNc2FpZ207gNMT5jG3AouMq1a8oTrPXYYDDLjXRq
	OdIx83w3dw/X+uiaRiaedUVw9zWIUWN7PGG202oVp7QkzUbqWdMroEe7qSvDYn/Uo9h22cTodm8
	kmM3JCeoXhh9jzZif2y7Q4r73HAXILAtiydup4uFkunCe175b7wKyj8eM5zhOaRa419bRfgp5W9
	igGSTytJSIezSe93HeIIv6V86i0we2ZiyNQPLwjyJGuujxELh6B5cAx6Z4Z1uCo+IV51jAyeL4E
	3QCbHN/NPPzY9GQ78EyLEVshNrvMUF676x9KGxNJx0up3rimIAn5TWvgCeE1rhBngJfOASE7DM/
	o4G
X-Received: by 2002:a05:622a:1443:b0:535:70c4:acb5 with SMTP id
 d75a77b69052e-53575676cd0mr26716831cf.74.1791365485280; Wed, 07 Oct 2026
 02:31:25 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 02:31:24 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 02:31:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ting-Han Hou <ue081723@gmail.com>
Date: Wed, 7 Oct 2026 02:31:24 -0700
X-Gm-Features: AclHuK_M5ZwDEgUCZcN5sDRi4hG5QFrbve1kCCyRiS9BbDdrGk-MVvVeK8mttpM
Message-ID: <CA+NtrhTyE4J-C2=hSUXYc+NJBsQeYvbwJb+-ROHE1QQP-_gYzg@mail.gmail.com>
Subject: [PATCH] scripts/gdb: Fix radix tree lookup pointer handling
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ting-Han Hou <ue081723@gmail.com>

lookup() casts each slot to a pointer to a node pointer and then
dereferences it. Since the slot already contains an entry pointer,
this reads the entry's contents as another pointer instead of
returning the entry itself.

Internal entries also need their tag bits removed before descending
to the next node.

Return non-internal entries directly and use entry_to_node() when
descending through internal entries. Remove the explicit shift
counter, as traversal now follows the entry type.

Fixes: b7235d6bb516 ("scripts/gdb: add a Radix Tree Parser")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
Tested with GDB 15.1 against standalone GCC-built C fixtures using the
xarray/xa_node field layout, with XA_CHUNK_SHIFT=4 and 6. These are
synthetic debugger fixtures, not a booted kernel or a kernel core dump.

Before the fix, a one-level lookup returned the payload 0x12345678
instead of its address; a two-level lookup missed a populated slot.
After the fix, all 33 checks passed for each slot configuration (66
total), including empty/direct roots, one- to three-level trees,
zero-filled payloads, value entries, absent/out-of-range indices,
struct/pointer roots, and the GDB convenience function.

This does not test multi-index entries or concurrent updates/retry
entries. The change is limited to the debugger lookup helper.

 scripts/gdb/linux/radixtree.py |   15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/scripts/gdb/linux/radixtree.py b/scripts/gdb/linux/radixtree.py
--- a/scripts/gdb/linux/radixtree.py
+++ b/scripts/gdb/linux/radixtree.py
@@ -55,24 +55,15 @@
     if (index > maxindex):
         return None

-    shift = node['shift'] + constants.LX_RADIX_TREE_MAP_SHIFT
-
     while True:
         offset = (index >> node['shift']) & constants.LX_RADIX_TREE_MAP_MASK
         slot = node['slots'][offset]

         if slot == 0:
             return None
-
-        node = slot.cast(node.type.pointer()).dereference()
-        if node == 0:
-            return None
-
-        shift -= constants.LX_RADIX_TREE_MAP_SHIFT
-        if (shift <= 0):
-            break
-
-    return node
+        if not is_internal_node(slot):
+            return slot
+        node = entry_to_node(slot)

 def descend(parent, index):
     offset = (index >> int(parent["shift"])) & constants.LX_RADIX_TREE_MAP_MASK
