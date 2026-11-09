Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228803;
	b=Vp+a1Kl1Rxl0D6Gkt1thGqvJkfHF/iRxczO5LqTy17JXNXXqHVNtyJ4ISvmJTOhsEgzN
	 d5u8ZP490hOwRe7020YVmahy3Gasn5bwfXQSXR3LbAK9emMwdaXXJ5MhGO2e0fRSVTzzk
	 uwqXzIfrwadUnkoZ+L/5+IS0dBOVYLXTUu6ufiHgUo4FGkiIA2sZOiKhjW++55hTu7QIe
	 HMAJOBGkwGyw8gTZfuV+rsY0Uoso7/4H3l3SG/NZxkD6JC7Ck/I9+VPxsLMWQjj2QAbYd
	 N27WsnnomfRRTpvUTKd/UzQayhkg9wYaHI9+lw6nOZAX92oddw7TmDLIEPj63NMXckQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W/DO9Gs2coC2gyNT5FT1NNnyfJA69Iae4tj7U+UUHeY=;
	b=kErtzpWtDCUjUALRIRD0HBAgJz1IrOS9AbIUxqqSTFR5arX3H232YUV33vITAiW+/lkn
	 5NVp09ArJ6yDnCSAiOS+0doG3xdnozO0K1w2Ne+tdKboE9U+sAdFOZD2EaHVXpNMDC3Y+
	 xgjpelPHfIjNW+eh0gGbsXECqn2ug66b/hbrrpjzOzF30c114UaLejgVQaS4G36RjzdYU
	 yVbXey5ROQ/lSNKVB28azX8ssjKPUaikLfXQudIJHsYajDVoz4MdrplJGEnBEMGXyDLKL
	 7KXtVQKTEj3D/Z8BKBRaLIADJZGzdvuzOqxySryAGK5d33qMkOurKI4tMdzVekOz7Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rk69yoEa;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C55F606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C55F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rk69yoEa
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso430900a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794228802; x=1794833602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/DO9Gs2coC2gyNT5FT1NNnyfJA69Iae4tj7U+UUHeY=;
        b=rk69yoEahopBQRbDXmeIwLaykCdQa6VgNOYpSieGXHjWihOVbl2eqdFGyDxloo2ryK
         U+3+aV0HM6Lx92tgA0y1DhyCwiNZfr/cchf7Brhwx9mgEnTn4unErxeMvuRM2D0DUxhL
         TUYU3AHt9PH3au5MhpKGNqBEaMMXQPxnC8rHwaCg1V3oe6KjpG+mlHKazkN1iGoFCMnl
         elLlCRGmkS9kgKjdS6mowvxY3IhDaC/qI6ndM57uwFnnY8kUUJDNENtypI5CSGlvk6fT
         O22QMcW4NOOP2XsFOERxGnmuROziyVpcjtxb2sF7xIJC92Ia4L7qnxsDLVJffHUFQ+UV
         7I3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228802; x=1794833602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/DO9Gs2coC2gyNT5FT1NNnyfJA69Iae4tj7U+UUHeY=;
        b=LLZqwn4wchZ5J8IFg0m9VDkVII1au8wAqWUGT42LfRCWqOZ66Sin0QYtuiiiU0OaRh
         D9ryuTFlbaLQGAYR1nZnCE46mC6GfhEDiFX9qMd11yW6EfBlDu2IHOQ/QednD/Q+TUzX
         VnEa6cRZr2usCSyMA2ahUpqwuJRVvP3pbINtRBFqJq3hhAgULT7Fk2ygF6p2fV31P6hM
         E7bCJiVZfed6nRLIT+Sc04Ue2v/zvE5I7+GEn2jWDeoK2EzbZZo7Hm/7bcSs45xF1PkL
         tM44dB5vhslg6XqLr5wJweolvucAmkunPdYF1USDY6n+Kj0zL2GraCoF7Wi6hFOhNZBW
         pTVQ==
X-Forwarded-Encrypted: i=1; AL+hErHmlUywMqP0RJARQO04NllyuUxENtcbwcrVjxEZgoRAmxBsYt9HIAKagZ9fou6Dx52ZXixWWe4bFFaIuPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tj/OY3ZJFixG/rwyqOSU8PU/6m7iyC0xZSV0WS7pUhX186Id0
	rc/6o0lNng/u3vHY7+crur1IdEzm0Pzw6Qqy+H5yEgMNx7G29Uwln9tA
X-Gm-Gg: AYBFou3XByHa26I0vNxjXItgi22Po9hoPc5loKL8CqN3zr+d55kOwAndyouIqw6DGrR
	X1giDTr8PR1dlbrAA+x8XADr1cK3Yiuvr1ajFYuZo724/7vSLo36pVZcOhYve0w2Tg/fve0z8XL
	tkiiUBgkPEF/3fvZXfvslZP9DhOxpIrzyZvfUFY/wcvqjA+f+WsnYieI/YJAyY5WBDsGM3Oax0g
	XBqUnO3TSTl2fU/xSP/chNAEEXz8IZnoB9TIcZWNNfEinvbrmaUQzrp5TH4pOE+zF3YxpFVSTgf
	hg8cc/1a4k6jvkQr/tff+btwNN2YK5FdrC4kYs900gQqwCbfxL5MQ9+P018lA3W899wpLYVEQoh
	9cYfPk6Xcd4bgeudGk9fchhdx4kNkds63yO44Jvbmg3zeh3CT39VRCew9Jz4YCN01xhR30fsGUM
	WKYc6HyEjIps9RslDIYi/flE9A1pmjZevon3uUjrnDlBnDfmnWKYJwJkVuoFtGhUXWz2BmzjdTO
	mq/6NihytK34P5vJo4BfP1LjaTWcJxY0s+FhqqgvFXXLsgJ/Ymua4zvHVAOhGH3ae6L7WRUsaZ3
	TZjGG2WEDPmKGFedOZ6vSvjIpuBsn2K7OPdNWpm14EjcBnHBtQ==
X-Received: by 2002:a17:90b:3d8a:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3b12d4f77a0mr2397080a91.26.1794228802018;
        Mon, 09 Nov 2026 04:53:22 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b126385c62sm6918186a91.8.2026.11.09.04.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:53:21 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] igmp: use the joined device when leaving a multicast group
Date: Mon,  9 Nov 2026 21:53:11 +0900
Message-ID: <20261109125312.2208874-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ip_mc_leave_group() resolves in_dev from the leave request before
matching the request against the socket's multicast membership list.
This lookup can return NULL even while the interface recorded in the
matched membership (iml->multi.imr_ifindex) is still alive:

1. An application joins a group using a local IPv4 address, that
   secondary address is later removed while the interface stays up,
   and the application leaves using the same 8-byte ip_mreq.
2. An unprivileged user joins a group with a 12-byte ip_mreqn
   specifying a valid imr_ifindex and a nonlocal imr_address, then
   leaves with an 8-byte ip_mreq containing that nonlocal address
   and no ifindex.

Because imr_address is nonzero, the early -ENODEV check is bypassed.
The loop then removes and frees the socket's ip_mc_socklist entry
(iml) and returns 0, but skips ip_mc_dec_group() because in_dev is
NULL. Closing the socket cannot release the group via
ip_mc_drop_socket() because the socket membership entry has already
been unlinked. This leaks the interface's struct ip_mc_list reference
and multicast MAC filter beyond the socket's lifetime, allowing an
unprivileged user to repeatedly leak multicast group entries on a
live interface.

Fix this by looking up in_dev from the matched membership's saved
imr_ifindex under RTNL, matching ip_mc_drop_socket(). If the interface
was genuinely removed, inetdev_by_index() still returns NULL and the
existing hot-unplug cleanup behavior is preserved.

Fixes: 4eba7bb1d72d ("ipv4: igmp: Allow removing groups from a removed interface")
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Tested on Linux 7.4-rc1 in QEMU/KVM as an unprivileged user (UID 1000)
for both the unprivileged ifindex/nonlocal-address mismatch and the
secondary address removal scenario.

Unpatched 7.4-rc1 guest output:
  IGMP_VM_BEGIN kernel=7.4.0-rc1 expect=--expect-leak
  IGMP_VM_CASE=nonlocal-address
  uid=1000
  control_explicit_ifindex
  after_drop=0
  after_close=0
  case_address_only
  join=0
  drop=0
  after_drop=1
  after_close=1
  joins_ok=16
  drops_ok=16
  closes_ok=16
  groups_after=16
  result=PASS
  IGMP_VM_CASE=removed-secondary-address
  uid=1000
  address_removed=1
  primary_present=1
  after_remove=1
  drop=0
  after_drop=1
  after_close=1
  result=PASS

Patched 7.4-rc1 guest output:
  IGMP_VM_BEGIN kernel=7.4.0-rc1 expect=--expect-fixed
  IGMP_VM_CASE=nonlocal-address
  uid=1000
  control_explicit_ifindex
  after_drop=0
  after_close=0
  case_address_only
  join=0
  drop=0
  after_drop=0
  after_close=0
  joins_ok=16
  drops_ok=16
  closes_ok=16
  groups_after=0
  result=PASS
  IGMP_VM_CASE=removed-secondary-address
  uid=1000
  address_removed=1
  primary_present=1
  after_remove=1
  drop=0
  after_drop=0
  after_close=0
  result=PASS

Reproducer (igmp-multicast-reference-leak.c):

/* SPDX-License-Identifier: GPL-2.0-only */
#define _GNU_SOURCE
#include <arpa/inet.h>
#include <errno.h>
#include <ifaddrs.h>
#include <net/if.h>
#include <netinet/in.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>

/*
 * Run in a disposable network namespace. The affected kernel retains
 * groups after a successful address-only leave and socket close.
 */
#define BATCH_GROUPS 16

_Static_assert(sizeof(struct ip_mreqn) == 12, "ip_mreqn must include ifindex");
_Static_assert(sizeof(struct ip_mreq) == 8, "ip_mreq must omit ifindex");

struct observation {
	int before;
	int after_join;
	int after_drop;
	int after_close;
};

struct accumulation {
	int before;
	int after;
	int joins;
	int drops;
	int closes;
};

struct interface_state {
	bool up;
	bool primary_present;
	bool additional_present;
};

static void die(const char *operation)
{
	fprintf(stderr, "%s: %s\n", operation, strerror(errno));
	exit(EXIT_FAILURE);
}

static struct in_addr address(const char *text)
{
	struct in_addr addr;

	if (inet_pton(AF_INET, text, &addr) != 1) {
		fprintf(stderr, "invalid IPv4 address: %s\n", text);
		exit(EXIT_FAILURE);
	}
	return addr;
}

static struct interface_state churn_interface_state(void)
{
	struct in_addr primary = address("192.0.2.1");
	struct in_addr additional = address("192.0.2.10");
	struct interface_state state = { 0 };
	struct ifaddrs *interfaces, *ifa;

	if (getifaddrs(&interfaces))
		die("getifaddrs");
	for (ifa = interfaces; ifa; ifa = ifa->ifa_next) {
		struct sockaddr_in *in;

		/* IPv4 aliases may be reported as eth0:1 by getifaddrs(). */
		if (strncmp(ifa->ifa_name, "eth0", 4) ||
		    (ifa->ifa_name[4] && ifa->ifa_name[4] != ':'))
			continue;
		state.up |= !!(ifa->ifa_flags & IFF_UP);
		if (!ifa->ifa_addr || ifa->ifa_addr->sa_family != AF_INET)
			continue;
		in = (struct sockaddr_in *)ifa->ifa_addr;
		state.primary_present |= in->sin_addr.s_addr == primary.s_addr;
		state.additional_present |= in->sin_addr.s_addr == additional.s_addr;
	}
	freeifaddrs(interfaces);
	return state;
}

/* /proc/net/igmp prints each group as a hexadecimal __be32 value. */
static int group_present(unsigned int ifindex, struct in_addr group)
{
	char line[256], device[IFNAMSIZ];
	unsigned int index, group_count, raw_group, users;
	bool on_interface = false;
	int found = 0;
	FILE *file;

	file = fopen("/proc/net/igmp", "r");
	if (!file)
		die("fopen /proc/net/igmp");

	while (fgets(line, sizeof(line), file)) {
		if (sscanf(line, " %u %15s : %u", &index, device,
			   &group_count) == 3) {
			on_interface = index == ifindex;
			continue;
		}
		if (on_interface &&
		    sscanf(line, " %x %u", &raw_group, &users) == 2 &&
		    raw_group == group.s_addr) {
			found = 1;
			break;
		}
	}
	if (ferror(file))
		die("read /proc/net/igmp");
	if (fclose(file))
		die("fclose /proc/net/igmp");
	return found;
}

static struct ip_mreqn join_request(struct in_addr group,
				    struct in_addr interface_addr, int ifindex)
{
	struct ip_mreqn request = {
		.imr_multiaddr = group,
		.imr_address = interface_addr,
		.imr_ifindex = ifindex,
	};

	return request;
}

static struct observation probe(const char *name, struct in_addr group,
				struct in_addr interface_addr,
				unsigned int ifindex, bool drop_with_ifindex)
{
	struct ip_mreqn join = join_request(group, interface_addr, ifindex);
	struct ip_mreq drop = {
		.imr_multiaddr = group,
		.imr_interface = interface_addr,
	};
	struct observation result;
	int fd;

	printf("%s\n", name);
	result.before = group_present(ifindex, group);
	printf("before=%d\n", result.before);
	fd = socket(AF_INET, SOCK_DGRAM | SOCK_CLOEXEC, 0);
	if (fd < 0)
		die("socket");
	printf("socket=%d\n", fd);
	if (setsockopt(fd, IPPROTO_IP, IP_ADD_MEMBERSHIP,
		       &join, sizeof(join)))
		die("IP_ADD_MEMBERSHIP");
	printf("join=0\n");
	result.after_join = group_present(ifindex, group);
	printf("after_join=%d\n", result.after_join);

	if (drop_with_ifindex) {
		if (setsockopt(fd, IPPROTO_IP, IP_DROP_MEMBERSHIP,
			       &join, sizeof(join)))
			die("IP_DROP_MEMBERSHIP (ip_mreqn)");
	} else if (setsockopt(fd, IPPROTO_IP, IP_DROP_MEMBERSHIP,
			      &drop, sizeof(drop))) {
		die("IP_DROP_MEMBERSHIP (ip_mreq)");
	}
	printf("drop=0\n");
	result.after_drop = group_present(ifindex, group);
	printf("after_drop=%d\n", result.after_drop);
	if (close(fd))
		die("close");
	printf("close=0\n");
	result.after_close = group_present(ifindex, group);
	printf("after_close=%d\n", result.after_close);
	return result;
}

static int count_batch_groups(unsigned int ifindex)
{
	char text[INET_ADDRSTRLEN];
	int count = 0;

	for (int i = 1; i <= BATCH_GROUPS; i++) {
		snprintf(text, sizeof(text), "239.250.34.%d", i);
		count += group_present(ifindex, address(text));
	}
	return count;
}

static struct accumulation accumulate_groups(struct in_addr interface_addr,
					     unsigned int ifindex)
{
	char text[INET_ADDRSTRLEN];
	struct accumulation result = { 0 };
	struct ip_mreqn join;
	struct ip_mreq drop;
	int fd;

	result.before = count_batch_groups(ifindex);
	printf("groups_before=%d\n", result.before);
	for (int i = 1; i <= BATCH_GROUPS; i++) {
		snprintf(text, sizeof(text), "239.250.34.%d", i);
		join = join_request(address(text), interface_addr, ifindex);
		drop.imr_multiaddr = join.imr_multiaddr;
		drop.imr_interface = interface_addr;
		fd = socket(AF_INET, SOCK_DGRAM | SOCK_CLOEXEC, 0);
		if (fd < 0)
			die("batch socket");
		if (setsockopt(fd, IPPROTO_IP, IP_ADD_MEMBERSHIP,
			       &join, sizeof(join)))
			die("batch IP_ADD_MEMBERSHIP");
		result.joins++;
		if (setsockopt(fd, IPPROTO_IP, IP_DROP_MEMBERSHIP,
			       &drop, sizeof(drop)))
			die("batch IP_DROP_MEMBERSHIP");
		result.drops++;
		if (close(fd))
			die("batch close");
		result.closes++;
	}
	result.after = count_batch_groups(ifindex);
	printf("joins_ok=%d\ndrops_ok=%d\ncloses_ok=%d\ngroups_after=%d\n",
	       result.joins, result.drops, result.closes, result.after);
	return result;
}

static int run_original(bool expect_leak, unsigned int ifindex)
{
	struct in_addr interface_addr = address("203.0.113.77");
	struct observation control, affected;
	struct accumulation batch;
	bool pass;

	control = probe("control_explicit_ifindex", address("239.250.33.1"),
			interface_addr, ifindex, true);
	affected = probe("case_address_only", address("239.250.33.2"),
			 interface_addr, ifindex, false);
	batch = accumulate_groups(interface_addr, ifindex);
	pass = control.before == 0 && control.after_join == 1 &&
	       control.after_drop == 0 && control.after_close == 0 &&
	       affected.before == 0 && affected.after_join == 1 &&
	       affected.after_drop == expect_leak &&
	       affected.after_close == expect_leak &&
	       batch.before == 0 && batch.joins == BATCH_GROUPS &&
	       batch.drops == BATCH_GROUPS && batch.closes == BATCH_GROUPS &&
	       batch.after == (expect_leak ? BATCH_GROUPS : 0);
	printf("result=%s\n", pass ? "PASS" : "FAIL");
	return pass ? EXIT_SUCCESS : EXIT_FAILURE;
}

/*
 * The caller first adds 192.0.2.1/24 to eth0, then 192.0.2.10/24 as a
 * secondary address. After "ready_to_remove_address=1", it deletes only
 * the secondary address and sends one byte on stdin; eth0 remains up.
 */
static int run_address_churn(bool expect_leak, unsigned int ifindex)
{
	struct in_addr group = address("239.250.35.1");
	struct ip_mreq request = {
		.imr_multiaddr = group,
		.imr_interface = address("192.0.2.10"),
	};
	int before, after_join, after_remove, after_drop, after_close, fd;
	struct interface_state before_state, after_state;
	char token;
	ssize_t n;
	bool pass;

	printf("case_address_churn\n");
	before_state = churn_interface_state();
	printf("address_present_before=%d\ninterface_up_before=%d\n",
	       before_state.additional_present, before_state.up);
	before = group_present(ifindex, group);
	printf("before=%d\n", before);
	fd = socket(AF_INET, SOCK_DGRAM | SOCK_CLOEXEC, 0);
	if (fd < 0)
		die("socket");
	printf("socket=%d\n", fd);
	if (setsockopt(fd, IPPROTO_IP, IP_ADD_MEMBERSHIP,
		       &request, sizeof(request)))
		die("address-churn IP_ADD_MEMBERSHIP");
	printf("join=0\n");
	after_join = group_present(ifindex, group);
	printf("after_join=%d\n", after_join);
	printf("ready_to_remove_address=1\n");
	if (fflush(stdout))
		die("fflush");
	do {
		n = read(STDIN_FILENO, &token, 1);
	} while (n < 0 && errno == EINTR);
	if (n != 1) {
		fprintf(stderr, "expected one-byte address-removal signal\n");
		return EXIT_FAILURE;
	}
	after_state = churn_interface_state();
	printf("address_removed=%d\ninterface_up=%d\nprimary_present=%d\n",
	       !after_state.additional_present, after_state.up,
	       after_state.primary_present);
	after_remove = group_present(ifindex, group);
	printf("after_remove=%d\n", after_remove);
	if (setsockopt(fd, IPPROTO_IP, IP_DROP_MEMBERSHIP,
		       &request, sizeof(request)))
		die("address-churn IP_DROP_MEMBERSHIP");
	printf("drop=0\n");
	after_drop = group_present(ifindex, group);
	printf("after_drop=%d\n", after_drop);
	if (close(fd))
		die("close");
	printf("close=0\n");
	after_close = group_present(ifindex, group);
	printf("after_close=%d\n", after_close);
	pass = before_state.up && before_state.primary_present &&
	       before_state.additional_present && after_state.up &&
	       after_state.primary_present && !after_state.additional_present &&
	       before == 0 && after_join == 1 && after_remove == 1 &&
	       after_drop == expect_leak && after_close == expect_leak;
	printf("result=%s\n", pass ? "PASS" : "FAIL");
	return pass ? EXIT_SUCCESS : EXIT_FAILURE;
}

int main(int argc, char **argv)
{
	bool churn = argc == 3 && !strcmp(argv[1], "--address-churn");
	const char *expectation = churn ? argv[2] : argc == 2 ? argv[1] : NULL;
	const char *ifname = churn ? "eth0" : "lo";
	bool expect_leak;
	unsigned int ifindex;

	if (!expectation ||
	    (strcmp(expectation, "--expect-leak") &&
	     strcmp(expectation, "--expect-fixed"))) {
		fprintf(stderr,
			"usage: %s [--address-churn] --expect-leak|--expect-fixed\n",
			argv[0]);
		return 2;
	}
	expect_leak = !strcmp(expectation, "--expect-leak");
	ifindex = if_nametoindex(ifname);
	if (!ifindex)
		die("if_nametoindex");
	printf("uid=%u\ninterface=%s ifindex=%u\nexpectation=%s\n",
	       (unsigned int)getuid(), ifname, ifindex,
	       expect_leak ? "leak" : "fixed");

	if (churn)
		return run_address_churn(expect_leak, ifindex);
	return run_original(expect_leak, ifindex);
}

 net/ipv4/igmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
index 144fca158..52cde8782 100644
--- a/net/ipv4/igmp.c
+++ b/net/ipv4/igmp.c
@@ -2463,6 +2463,8 @@ int ip_mc_leave_group(struct sock *sk, struct ip_mreqn *imr)
 				iml->multi.imr_address.s_addr)
 			continue;
 
+		/* The drop request may not resolve to the joined device. */
+		in_dev = inetdev_by_index(net, iml->multi.imr_ifindex);
 		(void) ip_mc_leave_src(sk, iml, in_dev);
 
 		*imlp = iml->next_rcu;
-- 
2.43.0
