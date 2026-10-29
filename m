Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793257943;
	b=NR3Mw9eIidTlbMQQfc64QnRmwa/vrwUcOx3xbn5UtEtjfT9YvFQIMy4A8OH7Xqv28DfV
	 SC7QM4RnNMpl2ukHOO9+e5+le2ah0BTicFMcxj/Fj0KD5IxmXw5EoVNHA91UGKMKGkvap
	 m+Mu54ITNq1NBiYYuCyRr3wAVmWOLulaGrVhO7I/pzrm5FMDMZE//zFepOksuaOecpAYj
	 Xt5Lu6PI6dh6r91jiyWfW+5Nh4x7gZGU4Bo7QWa1X1cy0ncRh6KrhZL3T3c1m0tPWF+nk
	 rbm7S03MAlcTcPuzqhr8diSdaqbtGuaVE5sMS/BCGpX7j1RkEAT3ZfWbHK1VQ/gxX4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=OKTunFxy+QwpzleRwVzIIagIb2M+Uzm8Zh8ZKBDtS0U=;
	b=BiV60xzIV3Iq2A4trhYCw3CizmRSR2h3D2wfT6/tA6JJzO03gO1Qfxens26OcuagNez2
	 N4MFslDqaXFvOu8RrkgDVct11Ah1LCD5Bm7lSopt5Av7El42ayeAciGVMkuXlfjm7QhBS
	 5p6MVnjNuQ+Akn6xaMGcFMaPRvaBL3o9JCYTMwPe9C86f5BAOZn9rgq7FlWHCk+J1ijHi
	 CaDHWWZmAimVPVsOGm9rYCeJcQL5fA6VcaUNGCOm3IKRL8hifCGZv9ePgIKcfiek5Efl9
	 NNQZn3AfkLxKPMfXp1neElBjPNelUdu4c4LCZs41zGG/QFYJT1jvQkAupB6n0UfJM1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w+dn/dwg";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15950606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15950606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+dn/dwg
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a208d93758so18162745e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793257941; cv=none;
        d=google.com; s=arc-20260327;
        b=MKQtECo8uLPuNpvWes14LZTEis9YRbeUMHOyvtQrwWQzdii5WaqnaQsUZuCo1M1wA9
         jtinwrtA+jytRe5VNEYYJer+0+JMuXxuhULovwuX/Lt6etJpt88bAmfyF17pORCD799w
         AuF7JzC5IaUhk8BZ4cpuBpu14QuT557B83vWbp2lDDfZO6TxDLBxsyPStmr3ggO6IcWY
         i9Do9NKshAstqC2nA6QdBnBlwHcCNYbWh2l6+0Z5wVtU6WdFnYYxO2MNsylz3XNr+f75
         8bblrKnOxCzRfna9pPMl5OEfJCeFbLP8YSvvbDDlc0ePWbdo77qAZjQVenqMByjvDRx4
         DU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=OKTunFxy+QwpzleRwVzIIagIb2M+Uzm8Zh8ZKBDtS0U=;
        fh=m6opvwV4Ln5uqgDzWw26i9d95CCf2BWL1Z+Ee6AOspQ=;
        b=NuTco211ZFiDNcQAwydzVkoaWx6DolUlOA5y3GcUGq59/4vunG7lU8z+J3WSbl/twR
         LGeaXS0345+xfxl1IVRIuy52JVCoID8jgWm+Mfv5HYAgD2HhadA7A97AdX4znm7/RARa
         fPAMmXRh8XTrjXp37ZF81ZmQLHYRQ93VQNv5B7nOqYJrkxng1HmDDbXrpPaWql8YoDYx
         DNdwBA39HcAoXAQTM8raJflWxBx/9Xkqf3i1wivExEFK/BotdCiHFsA/bzfkT8LLvbQ6
         5MfPmLG1QZDlgBtQuBoE6vr9NL/RvdXSfjRMGEV2gMFfNgO4LaaUrNvN1Rehxe0WhaJe
         HLyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257941; x=1793862741; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OKTunFxy+QwpzleRwVzIIagIb2M+Uzm8Zh8ZKBDtS0U=;
        b=w+dn/dwgtbrysHaAXv9ETJPfMsaFELE4gakBZpylLTZ5oGcJrz5KSTONKHRlOdE2I4
         IWwoXJjpxNpfxrVO2kDMbcup7bpMDblzyW+qq7XJI/IJFjCe4wqkAHp8PB9Cy7oyNhOF
         unwwH+zFYGfXrW7pOQHwxSYLXWpKmpbcLrGKBqh8OKO+bLeAU3dxFPBtGnFChn/8keYi
         XVVkXjIP6SzJ3dv01NteeWbX91ClybUiHZT7/g/Ua9i9YO1VAI1S8Xd8/InCgNtdg0yv
         rdsozN/MTriCUneq8he1ytUB8+ohVVoULeuVXz8xwsAMHAHhQXQo1AsAI4pQCorBJX27
         KESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257941; x=1793862741;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OKTunFxy+QwpzleRwVzIIagIb2M+Uzm8Zh8ZKBDtS0U=;
        b=IJGLbQZWbNPjPydJuQdZZuTonXj5PyBEiVqlPXEMjs7yfp72LpFaUhdTotEPY+y6Do
         ejaQ6Xh8Z+1hjjxA2DKLIse0KLyiUzIsjCM+gRqS4zf6ORp/HVwrYPrMVMU3dxcr1F2v
         2qNUgLP7fKrMaytlGazXX6Hm+hxOB9p+wK2neuy4+mNxx42ATghdZzfYUgRZN0Mo3xut
         EsdCT6D6SX3Pd04av39sEBBU5uxaa8n5xvr7aV3NX3PFK9O8tIZmAMRsYAU7ECj7z2xv
         K5czoWAxTPsjdF0UV8I8ZSQsWfVopWjunDdjkg42ihMxUMeB1cejDzSZkOitN9MgW4CQ
         ZfxQ==
X-Forwarded-Encrypted: i=1; AKwUvBz741Tap+qqxBEpzEYsv4bPG96tD/C4n6gG7R8TM8+Ms7ddkxwmfdnxzqY2TOkkDW61iasAeYJCArfoEWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTu/61Chz7rCYMdox6Z6UTPFgbOqAjMUF3dNzdi7lbz3ZzQGEP
	UldLZEWozjf5TN9D3npEOAgGpqpuq1pyN2RuWqnk+p9FpTUbs8XfINHFgHlebFYIqEilI4PPGxM
	XrKP9YJAHm5NFtcQTIFeBP1c4QBDzgl4=
X-Gm-Gg: AYBFou0yZk24zM91V+XPhc7I/fWab6CdNQex77bwrn+s3G0qkb3SD7sUcbi6gQurSLo
	HWUn03sc53nyDk64ySK/yP2aKbGphbZ4r7d5/L2vWOlBP/llBTt4/HHDYo7hau/7aQuHM8m9KoX
	zAAuT8BH6Nb/MNDPwG2CbZ+kwZ2U+C70DSA6hIcRhsT3NJjIYPFYahF+HMh2Ii/Oo2lK4AMvasM
	RttxFiEu14fBXQn1ZLS7g/LsBSsYxlu+S1eC/O5wfDKOmQ7JU+FeRL83nHKU8PF6oGEf6jOkF7V
	DZDbT1Tqw59/JplJg/6lqywVYIWLJ3nNKr3NXh9U8Ja7s3+o2g5GkL+oqpgnfSvNcoIT5w2sjYZ
	cX7qwnygD2Rku11+ElwM61xSnq8jO3CvZmTIs2wx2qv7G71YdujI6yLrS3s9xEDYSC6r9rNEaRi
	g8qpgiFuDw5uv1A7YlLA==
X-Received: by 2002:a05:600c:1f94:b0:49f:fdca:c361 with SMTP id
 5b1f17b1804b1-4a9663995a8mr105499305e9.12.1793257941322; Thu, 29 Oct 2026
 00:12:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Ahmad AG <ahmadag1001@gmail.com>
Date: Thu, 29 Oct 2026 10:12:08 +0300
X-Gm-Features: AclHuK8oIQAbFPj51xALKq0pQMpaX8tYjUogaYqwbvGOzn7JupmqQ2AXYVRoUe8
Message-ID: <CAASqGyZ-9hqZGWNJShxnrSiXDO==51SVsQW_x_mk993y1pNO8A@mail.gmail.com>
Subject: [PATCH net] net/packet: charge fanout groups to the memory cgroup
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

fanout_add() allocates a new group with room for max_num_members
socket pointers. Since commit 9c661b0b8544 ("net/packet: make
packet_fanout.arr size configurable up to 64K") that is up to 64K
pointers, 512 KB per group, from a single PACKET_FANOUT setsockopt().
The allocation uses GFP_KERNEL, so it is not charged to the caller's
memory cgroup.

Each packet socket can create its own group, so a process with
CAP_NET_RAW in its own user and network namespace holds about 512 KB
of kernel memory per open socket that its memory cgroup never sees.
In a cgroup with memory.max set to 16M, 256 sockets each creating a
group with max_num_members = 65536 took 264 MB of system memory while
memory.current grew by 380 KB.

Allocate the group with GFP_KERNEL_ACCOUNT, as other allocations a
user can make on demand in the networking stack already do. With the
change the same test in the 16M cgroup is stopped by the cgroup's OOM
killer, and with memory.max at 512M the 256 groups charge 262656 KB
for 264640 KB of system memory used.

The missing charge was found by code inspection of net/packet/ with
the help of an LLM and then triggered with a small test program that
creates the sockets and groups and reads memory.current; the numbers
above are from that run. Tested in a QEMU/KVM guest on this tree
(x86_64_defconfig plus kvm_guest.config, KASAN, MEMCG, PACKET),
running the test as uid 1000 in a cgroup v2 memory cgroup.
tools/testing/selftests/net/psock_fanout passes before and after.

Fixes: 9c661b0b8544 ("net/packet: make packet_fanout.arr size
configurable up to 64K")
Cc: stable@vger.kernel.org
Assisted-by: Claude Code
Signed-off-by: Ahmad AG <ahmadag1001@gmail.com>
---
 net/packet/af_packet.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 823e0911c91..406397acc5c 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -1778,7 +1778,8 @@ static int fanout_add(struct sock *sk, struct
fanout_args *args)
  /* legacy PACKET_FANOUT_MAX */
  args->max_num_members = 256;
  err = -ENOMEM;
- match = kvzalloc_flex(*match, arr, args->max_num_members);
+ match = kvzalloc_flex(*match, arr, args->max_num_members,
+      GFP_KERNEL_ACCOUNT);
  if (!match)
  goto out;
  write_pnet(&match->net, sock_net(sk));

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0
