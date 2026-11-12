Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470103;
	b=2J6035YxWO9DnahfesBwAxHGf4apfen+Phh9wISaInhrxK5dW65xl1tVgYfS/XwLPMDL
	 USn4MiizrClH4kWMM1YqEpD6XrQoJ7jDcZjBxrHvg7jv60oAChXhUvQudkdqcgLVRiiF4
	 xvJKQ3AO+XDB19HBTwmNeEXJdCf3KxxFL5dBnzsmPV4E41eV7gEKqo4uKJCfNGGpFltx3
	 52tO4cGedsFmP04qykjkUesEQFPwYh3p7s+xPNH2eU8bL0N4bQcvKYAIAUjXiA6PHWPnk
	 v8o1K+f+uW9sSm4V+7fSYjxmhoz0PtrEeS2pErdFtQ9N/J8MSncdMOmak1ueNV72DJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9MfmP8CUu4hZ4XmurNDFRFxv/TJ/BsNwOyCw1nzKGdw=;
	b=g+2O8HECdhTc/s+RAC+Cay31Q5IugzLoaVPlnCUJ5NtQuaAekzyUgjSyP3Iwq719UKqj
	 qGDz93g24PRG8fmRcRPPbVWJtr2lHEua3+TK40gbq2vbmtlvWj60GDBCLCYKaj874n/0m
	 mfGEhgtE4RPG0FTZYdQA0yiqxjgSq0TdCsBEOocfv4jV3YeJX+Iq7OEn8WURp64HDu7lC
	 81Vm26S2txs45KnPgD+7ygQq7dRJzEBnFIFzYrCkHrbNNaPBwWfZSe0K6POz1mUVFaJ1T
	 kqyqy1yE3GBb6einrDKkdii2iOcHr0BnjZDfO5jJKV1tFcLCRYRLpXSoZ25NWAtr+aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=(null) smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=g9+gt+d9;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A808B606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A808B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=g9+gt+d9
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso6000422eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794470095; x=1795074895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9MfmP8CUu4hZ4XmurNDFRFxv/TJ/BsNwOyCw1nzKGdw=;
        b=g9+gt+d9iPMMqLhspZsy7g3mdTh88vkwtR+CIuTZMLa4Gik2Q4h8qrX5tc8U7iG1rs
         vLQSskA97r0w9s8b8Ry1E7MMg5jgMwk9u8glfY6ASApU6IrBioTWRPW0Ik08aQPYrTvz
         7L754KGrn5UQs8go7wUJ7xgeqg0iR3LlpiC/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470095; x=1795074895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9MfmP8CUu4hZ4XmurNDFRFxv/TJ/BsNwOyCw1nzKGdw=;
        b=yTFQTFVqMB6yOtGE/MayWJEXatJqqBNZMVgmn8b8Of1n40tjPm8Qesr1iObIrKuxpZ
         PuQXOEUVjUysYOMqa+Ecdc1qzbXPOCMmiwIRlxkbQ/t6sfdRnf7X8c/5PPSiY+62vXVb
         UPcUJsjJtkodzq/KHWGMQQMw9wigRyYalYTunWV71TwhZa9wVZdQMrkVK5hWXjFm3GkB
         lggDCXvG5aPAHYuQ2GpK82tZtVAB4aOyilu+3pbGYNHS+/H3K8BA5evZ2i4sP5G2KRNE
         8P6MxgVFH7S4CdIg5ZNTnz0+ERwXHZd682tnFVXmmnyD38NOzavZqohQ4ABa65mgpRSg
         UqGQ==
X-Forwarded-Encrypted: i=1; AL+hErE5d6tQV2paSTiIyCaxYTeYqA90caJhJmiE2343aaIADhxwCpy0SPaG8o5RgpjwlmYxClD2JHqaPzX/sEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nSNOui3FKMsrX34J5yua5BkJk/ciBteuxakW+2WGxIBTqhoty
	BEH73NmSYxg3w4u8CvhwondARwqpPS0RNRvn4jNTwlpCg3QffszlwPpLVaWSe8Xv2js=
X-Gm-Gg: AYBFou1pMvp/MHDaJMKjcCvmE7wFuZ6hUVQXbZJb6HO1A4h5WOQN2n1QbKDjAzkKYS5
	JolIpiFfD1eAH/qGAHQ08bziJJx26w+6KxG5azmP50duI+gyvxtNdtZtKE/mGAqd/L1zPo+XOg8
	HOVHIpEvVlj9U6oGFFY9qu+3Kas+EjzlF4F1nTzEHF4XJfUXq8aw1dV7cLcdEO4uf/ws5E1e+2Y
	TOAYA+AdMah8LCotPCeDQjYCFhd8U86SdxJS2gxcbU1Wq4j2fr+XetyUpTDV7S+ipWTqfla94TA
	hPiHASfZfG7hW6UAx7SsHhWX8gywRExwmbE0R1/lTsG+ZLnfkS9ow1dk0ghj085d1RuCE0ub7i7
	qjk3kFZCBCVqEnH3uXYb6PoC+cplVmC8AMdXhrlUA7yBAiOhaoVtkcIjLpS0l2sbjduM6Ww0ga6
	8Z+PPZkF6fIzbbyLSTfmFwYoPbj/X8IVGm85RHpDXyrE6CkJihgfgTcorx8cfLGplCZmceQmvdw
	I5ORyvFGeGDQGTEVh3Su6MrQUtZe3+FITEeY1wXnwOKQLJIQTxjWmjeiw4JC/4l/dDe5YB1WAY+
	UDeUmIxx15FWfA1glL4WX1AtVRkuvzLzy8cgv86Hyjh7uAjKWaH+lBLaT710y3iHHISOpTgdnIB
	Gt94riarjY/CL8mxz2FJB8jXzFnVnsZJXYhP5rf/xGvUmqG7OySScYEKq0OaESBv1
X-Received: by 2002:a05:693c:8344:b0:376:5b1b:c22d with SMTP id 5a478bee46e88-376831888d7mr4481214eec.4.1794470094622;
        Wed, 11 Nov 2026 23:54:54 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3766146551asm15484180eec.1.2026.11.11.23.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:54:54 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Piyus Kedia <piyus@iiitd.ac.in>,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [PATCH net] net/sched: act_csum: bound the IPv6 jumbo payload length
Date: Thu, 12 Nov 2026 13:24:45 +0530
Message-Id: <20261112075445.3555341-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tcf_csum_ipv6_hopopts() takes the payload length out of a hop-by-hop
jumbo option and stores it unchecked:

	case IPV6_TLV_JUMBO:
		optlen = xh[off + 1] + 2;
		if (optlen != 6 || len < 6 || (off & 3) != 2)
			/* wrong jumbo option length/alignment */
			return 0;
		*pl = ntohl(*(__be32 *)(xh + off + 2));

tcf_csum_ipv6() then hands ipl = *pl + sizeof(struct ipv6hdr) to the
per-protocol handlers as the extent of the packet, so a 32-bit value
chosen by whoever built the header reaches the length they read.

Both guards downstream fail on such a value.  In
tcf_csum_skb_nextlayer(), ipl + ntkoff is an unsigned int plus an int, so
an ipl just under 2^32 wraps to a small number and pskb_may_pull()
succeeds without pulling anything, while ipl < hl stays false precisely
because ipl is huge.  tcf_csum_ipv6_udp()'s UDPLITE arm then admits any
16-bit length, since ul <= ipl - ihl compares against ~4.29e9, and
csum_partial() reads that many bytes off the end of the skb.  (The plain
UDP arm is not affected: it requires ul == ipl - ihl.)

With payload_len 0xFFFFFFCA, a UDPLITE header claiming 60000 bytes and a
704-byte skb, KASAN reports:

  BUG: KASAN: slab-out-of-bounds in csum_partial+0x103/0x1f0 lib/checksum.c:119
  Read of size 4 at addr ffff8880259642c0 by task syz-executor/13111
   tcf_csum_ipv6_udp+0x19e/0x250 net/sched/act_csum.c
   tcf_csum_ipv6+0x63c/0x780 net/sched/act_csum.c:549
   tcf_csum_act+0x34d/0x480 net/sched/act_csum.c:601
   tcf_action_exec+0x109/0x390 net/sched/act_api.c:1161
   tcf_classify+0x13d/0x440 net/sched/cls_api.c:1875
   tc_run+0x31a/0x460 net/core/dev.c:4491
   __dev_queue_xmit+0x1a7e/0x2390 net/core/dev.c:4890
   ip6_output+0x280/0x400 net/ipv6/ip6_output.c:248
   rawv6_send_hdrinc+0xb90/0x1170 net/ipv6/raw.c:663
   rawv6_sendmsg+0x10d3/0x1260 net/ipv6/raw.c:908
  The buggy address belongs to the object at ffff888025964000
   which belongs to the cache skbuff_small_head of size 704
  The buggy address is located 0 bytes to the right of
   allocated 704-byte region [ffff888025964000, ffff8880259642c0)

The packet is generated locally through a raw AF_INET6 socket with
IPV6_HDRINCL and leaves an Ethernet device, so skb_network_offset() is
non-zero and the sum above wraps.  Reaching it needs a clsact qdisc with
a csum action carrying TCA_CSUM_UPDATE_FLAG_UDPLITE, which is
CAP_NET_ADMIN in the network namespace - reachable by an unprivileged
user through a user namespace.  The folded checksum of the out-of-bounds
bytes is written into the packet and transmitted.

Bound the length the way nf_ip6_check_hbh_len() already does for the same
option: a jumbogram carries payload_len 0 and more than IPV6_MAXPLEN
bytes, and the length it claims must be backed by the skb.  Once *pl is
bounded, ipl cannot exceed skb->len, the sum in
tcf_csum_skb_nextlayer() no longer wraps, and the UDPLITE comparison is a
real bound again.

Per Documentation/process/generated-content.rst: the out-of-bounds read
was found by an AI-driven fuzzing harness, developed
jointly by Kapil Vaswani and myself, which exercised the csum action
under KASAN on x86_64.  The root-cause analysis, this changelog and the
patch were written with the assistance of a large language model, 
and reviewed by hand; the before/after testing below
the --- was run by us.

Fixes: eb4d40654505 ("net/sched: add ACT_CSUM action to update packets checksums")
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
Tested on 7.3.1 with KASAN, in a single-VM qemu rig, same .config and
same image before and after; only net/sched/act_csum.o and the relink differ
(kernel build #2 unpatched, #3 patched):

              jumbo length  payload_len   before            after
  variant A   0xFFFFFFCA    16            KASAN, VM lost    ok, exit 0
  variant B   0xFFFFFFCA    0             KASAN, VM lost    ok, exit 0
  control     none (PadN)   16            not run           ok

  before, variant A: Read of size 4 at addr ffff888024cb6340, task 11851
  before, variant B: Read of size 4 at addr ffff88805fe8e9c0, task 9555

Both faulting runs reach csum_partial() through the trace above.  After the
patch both programs run to completion with every setup step succeeding and
all four sendto() calls accepted, so the packets do travel the egress path
and the action simply refuses the length:

  ntkoff=14 pl=0xffffffca ipl=0xfffffff2 ipl+ntkoff=0x00000000 \
      ipl-ihl=0xffffffc2 ul=60000

The control is the same program with the jumbo option replaced by a PadN and
a UDP-Lite length of 8, which is inside the packet.  It was run on the
patched kernel only, since what it is there to show is that the patch did
not break the path: the walker still accepts an ordinary hop-by-hop option
and csum_partial() still runs over the 8 bytes the packet really has.  Only
an unbacked jumbo length is rejected.

Reproducer: not included here.  This bug was found with AI assistance, which
Documentation/process/security-bugs.rst says to treat as public; the same
paragraph says not to post the reproducer publicly.  It is a short shell
script plus a ~40-line C sender, tested, and available on request.

Conditions it needs: a clsact qdisc with a csum action carrying
TCA_CSUM_UPDATE_FLAG_UDPLITE, on an Ethernet-type device, with the packet
locally generated so that skb_network_offset() is 14 and the sum in
tcf_csum_skb_nextlayer() can wrap.  CAP_NET_ADMIN in the network namespace,
which CONFIG_USER_NS makes reachable by an unprivileged user.

 net/sched/act_csum.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/net/sched/act_csum.c b/net/sched/act_csum.c
index 5fff52a8ca90..eab8cdf6745b 100644
--- a/net/sched/act_csum.c
+++ b/net/sched/act_csum.c
@@ -449,7 +449,8 @@ static int tcf_csum_ipv4(struct sk_buff *skb, u32 update_flags)
 	return 0;
 }
 
-static int tcf_csum_ipv6_hopopts(struct ipv6_opt_hdr *ip6xh, unsigned int ixhl,
+static int tcf_csum_ipv6_hopopts(struct sk_buff *skb,
+				 struct ipv6_opt_hdr *ip6xh, unsigned int ixhl,
 				 unsigned int *pl)
 {
 	int off, len, optlen;
@@ -463,13 +464,29 @@ static int tcf_csum_ipv6_hopopts(struct ipv6_opt_hdr *ip6xh, unsigned int ixhl,
 		case IPV6_TLV_PAD1:
 			optlen = 1;
 			break;
-		case IPV6_TLV_JUMBO:
+		case IPV6_TLV_JUMBO: {
+			unsigned int avail = skb->len - skb_network_offset(skb);
+			u32 pkt_len;
+
 			optlen = xh[off + 1] + 2;
 			if (optlen != 6 || len < 6 || (off & 3) != 2)
 				/* wrong jumbo option length/alignment */
 				return 0;
-			*pl = ntohl(*(__be32 *)(xh + off + 2));
+			pkt_len = ntohl(*(__be32 *)(xh + off + 2));
+			/* RFC 2675: a jumbogram carries payload_len 0 and more
+			 * than IPV6_MAXPLEN bytes.  Reject anything else, and
+			 * anything the skb cannot back: callers take this as
+			 * the extent of the packet and read that far into it.
+			 */
+			if (pkt_len <= IPV6_MAXPLEN ||
+			    ipv6_hdr(skb)->payload_len)
+				return 0;
+			if (avail < sizeof(struct ipv6hdr) ||
+			    pkt_len > avail - sizeof(struct ipv6hdr))
+				return 0;
+			*pl = pkt_len;
 			goto done;
+		}
 		default:
 			optlen = xh[off + 1] + 2;
 			if (optlen > len)
@@ -521,7 +538,7 @@ static int tcf_csum_ipv6(struct sk_buff *skb, u32 update_flags)
 				goto fail;
 			ip6xh = (void *)(skb_network_header(skb) + hl);
 			if ((nexthdr == NEXTHDR_HOP) &&
-			    !(tcf_csum_ipv6_hopopts(ip6xh, ixhl, &pl)))
+			    !(tcf_csum_ipv6_hopopts(skb, ip6xh, ixhl, &pl)))
 				goto fail;
 			nexthdr = ip6xh->nexthdr;
 			hl += ixhl;

base-commit: a2fd526d644233d6a892c28173f07c61e21e4c93
-- 
2.34.1

