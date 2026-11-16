Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853288;
	b=1Rb660j+qORi9KmrGssrt22uqLAGTgNE1VBs6IFfigGFqTauJ6jXVFcfR1Zqp5h0l0qP
	 F4+PWBNl6zfnM3mlqzl7I5iSbx1sAsMLU93EKAwcqsD4/My9mimSbpSZF3VHLqxjvaNl2
	 w4v+ntp6CxSzc6J1DaKPbp8sdvzygNaog5o/HwtAnOpu/z/k2SDarRiY+oulRSBINSGx1
	 3kLpFzPoLW9zQuInMtzGEh+olspi6yunNAgoXZ5Nk3Xmklht471c6OhJnRziG5v9OnxMm
	 0nbiCQz5zFn5PJWK+MPBtku/gHq9/jSqEt/AlPb95dvJtT4QrUXUMrNG+o0+fmSk4pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p5dhNKVlJG0xkKj4bfDWlEmzy8YnTRkYwXtN8P+qvLI=;
	b=Y3gVKHnZCcEjePtFxE99yCz7BuHDLmV0r4PIAaraKyytBmWVvHvixn7yRtzK/DwPLb1M
	 /hzEOGyvYoFEWWNQCD1fzdQWb9wq2Bj8hekbqjcDrxbyHUrHPFVy47nqNZBL0MN/ygHdq
	 oBRGpNKBIADwA2PRsdVs1+VhRC5X/l5FrpD+eXCvI87bSYU8n21EdpzLU77RDO0ys429Y
	 ocmuyYcm2QQeaize29hS3WrF+aGlH8LxXYcBVlIb2SGNx93Bb65V2hRWIcSzO5WwWXMRa
	 mf4POy7xXDIUwna+VwcBt+TOURlrlrT8hEirtpolRMRsxU5tk5brHp7i1GRgZm5sxRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=DGjwXInr;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBFC606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBFC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=DGjwXInr
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso2034721a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794853286; x=1795458086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p5dhNKVlJG0xkKj4bfDWlEmzy8YnTRkYwXtN8P+qvLI=;
        b=DGjwXInr3kumQ8PL2nJjnlvSZD47420W8pQOsRTyVrTYvKDfDbEPc9N95UPAJQeSWp
         wrZ3Cg+QksWsRDXFFf6vOAwHYtmL2zxg7qLcAc1Wk6dGdneOu7E7PontK1nI7fSiAPd+
         QIXaQjY3DtkLKZkIse2T1EDVU6vNesGHA/s2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853286; x=1795458086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p5dhNKVlJG0xkKj4bfDWlEmzy8YnTRkYwXtN8P+qvLI=;
        b=l7ZdAIjFFmpzqZHa2csgbIeXdozaa50dxct52kAl/2YBDQ76V3FKInT5O4o183S7C+
         7YM6scTjojdWRxgUCc6n/KElNkf7wb06/noKrqJjFHhORHeGS4iWjZZ55cDA4AzDaHYL
         qrgQ1mEPITQSl4JVsJYwuqsucPelm09WyyxX5J6Kp/qgxLRrHTDGzQkyEELgIb+9wUW6
         pHWapBNKQEH9o2aH7YiRD9k81VxuSmgf6EPXrLSX0MdNm2gcz7j30OOGZp9LB8swjQ+j
         oF2se3Hj6BK8jseIdOk/OmPhX5PsYGFgJw0VcKA90BUZiBnND+6LEFSwYLIFfHEGHwua
         4wuQ==
X-Forwarded-Encrypted: i=1; AL+hErEe/19dM4e0USmo0jcWK2do1eks3itEkiR3gSwTZeBhW3aC/EgbB2nau7x8sVPTTF372EQdu2Wj+zVh/ZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TO2tws/LOy+n34F8ZMS4PjumRjh5WEuNbx9PZBOacnYQ9PKCE
	ylzIJo60yYVX+cWW/gCW262sAXTIRN7R0ywnvV1lB9QFEBjaPqX0njW0RAqJiHocloY=
X-Gm-Gg: AZFdTZePoHvEpFZ/WXN5NlEDxUk2+VK1Xv1j6OHFOwoWOrL2U9PYhML3PzJvJnSmNIA
	ssmGxX0LgQtrKhHL/+MUCHRrOiiATphXPE3LcoAUwAqdd9oumqs9b1kD33c5SZ1/DR5sovkvlgE
	7DIZyhYSm+96NTdRgHXFMX9hgyrOFSh8ACjlDgfq+zXPAvTisCRjWhFJ1hPH2si4kmzIvF5W2L1
	hvSK+IAhjHrYKATui37RQpd5DZh+6iyh/eT7sQt26vKVTRNlAbMnXYzjGjekxhCfPOkonXtyzLg
	A7XQAAj65/S/rxrVLnO/U4VBjoIng2JDHOYpoatdYqY/WUYoVdMdoYdFVBwfif+TagQr2W2l9h7
	WATjAYc3IVCztQQxjJee1ExzWhuq2se0NRhTYwHqFbLqoY2Ihsl5QvMgzvnB+1vM+qq8vKzSAAw
	VgICr1gCZT6sahMqsWho3HZyP45jQbxxzTwlwbzOsDnLu74MxQ2U3vx0FmvYpm446isHeYHtipL
	L9ucTDXJAu6ZbjKHkXzQW8IoWKTuRYQviIXsKQo6HwtYF+5OY7es+9IcP8ZSXOS8rBT+Y1SRYBH
	753J5vUoYZnAAzFV4aMX+z7XAI7VA7wjNzpDzgkB5phps5fwysik6MxXjhjLJzgc/OE0DnTtmv1
	r874x/cgBt2EfTdapx84GUvGcWbGsE6Z4DE3UM9IY1wg4eBKgHgvRRsCF0YYi3tkN
X-Received: by 2002:a17:90b:2f0c:b0:3b0:8947:fad2 with SMTP id 98e67ed59e1d1-3b1b0ba0a4emr10830321a91.53.1794853286276;
        Mon, 16 Nov 2026 10:21:26 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm312798a91.10.2026.11.16.10.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:21:24 -0800 (PST)
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
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net v2] net/sched: act_csum: bound the IPv6 jumbo payload length
Date: Mon, 16 Nov 2026 23:51:08 +0530
Message-Id: <20261116182108.2581258-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116182108.2581258-1-piyus@iiitd.ac.in>
References: <20261116182108.2581258-1-piyus@iiitd.ac.in>
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

Three more paths take the same unbounded ipl.  tcf_csum_ipv6_tcp(),
tcf_csum_ipv6_icmp() and the ul == 0 arm of tcf_csum_ipv6_udp() each do

	skb->csum = csum_partial(hdr, ipl - ihl, 0);

with only tcf_csum_skb_nextlayer() in front of them.  When ipl lies in
[2^32 - ntkoff, 2^32 - 1] the sum there wraps to a v in [0, ntkoff - 1],
pskb_may_pull() succeeds and ipl < hl is false, so ipl - ihl arrives at
csum_partial()'s int len as the negative v - ntkoff - ihl.

Whether a negative length reads anything depends on the configuration,
and that is also why a KASAN fuzzer does not reach these three.  x86 has
two implementations of csum_partial() and the config chooses:

	arch/x86/Kconfig
		config GENERIC_CSUM
			bool
			default y if KMSAN || KASAN

With KASAN the kernel gets lib/checksum.c, whose do_csum() opens with
"if (len <= 0) goto out;" and reads nothing.  Without KASAN it gets
arch/x86/lib/csum-partial_64.c, which has no such test:

	if (likely(len >= 80)) { ... }	/* signed, false when negative */
	if (len >= 40) { ... }		/* signed, false */
	if (len & 32) { ... }		/* bitwise, runs */
	if (len & 16) { ... }
	if (len & 8)  { ... }
	if (len & 7)  { ... }

The first two tests are signed comparisons and the last four are bitwise,
so a negative length sums whatever its low six bits say, up to
32+16+8+7 = 63 bytes from the transport header.  With the payload_len
0xFFFFFFCA used above, a 16-byte hop-by-hop header (ihl = 56) and
ntkoff = 14, len is -70, whose low byte is 1011 1010, so the 32, 16, 8
and 2 blocks run and 58 bytes are read past a 20-byte TCP header.  The
folded result is written into tcph->check or icmp6_cksum and transmitted.

So "action csum tcp" and "action csum icmp" setups were exposed to a
bounded over-read of up to 63 bytes on kernels built without KASAN, while
the 65535-byte read reported below is the UDP-Lite case specifically.

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

The [BUG] report for this, with the KASAN trace, the reproduction
conditions and the impact, went to the list as a separate mail and was not
threaded with v1.  Both are linked below: the report first, then v1 and the
review of it.

Per Documentation/process/generated-content.rst: the out-of-bounds read
was found by an AI-driven fuzzing harness, developed
jointly by Kapil Vaswani and myself, which exercised the csum action
under KASAN on x86_64.  The root-cause analysis, this changelog and the
patch were written with the assistance of a large language model, 
and reviewed by hand; the before/after testing below
the --- was run by us.  The analysis of the TCP, ICMP and ul == 0 paths
added in this version came from addressing an AI-generated review of v1
on the list; the Kconfig and Makefile behaviour it rests on was checked
against the tree by hand.

Link: https://lore.kernel.org/r/20261112075159.3552470-1-piyus@iiitd.ac.in
Link: https://lore.kernel.org/r/20261112075445.3555341-1-piyus@iiitd.ac.in
Fixes: eb4d40654505 ("net/sched: add ACT_CSUM action to update packets checksums")
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
v2: changelog only; the code change is unchanged.

    v1 said the handlers passing ipl - ihl were protected because
    csum_partial() takes an int.  That was true of the kernel it was
    tested on and not of a kernel without KASAN, which links a
    csum_partial() with no len <= 0 test.  v2 states the exposure of
    tcf_csum_ipv6_tcp(), tcf_csum_ipv6_icmp() and the ul == 0 UDP-Lite
    arm, bounded at 63 bytes, and why the sanitiser hides it.

    Bounding *pl in tcf_csum_ipv6_hopopts() already closed all four
    paths in v1, so the diff is byte-for-byte the same.

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

