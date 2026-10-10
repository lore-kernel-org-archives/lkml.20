Received: from mail-oi2-f9.google.com (mail-oi2-f9.google.com [74.125.231.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2361533F5A7
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791617756; cv=none; b=bVWL7IaOzdyozYpu/ucInyUzUmLELve1KKgK3FJGzmXTGMXsSb0BwUvBYxPpxcbPwBpkIR+Y7i1JP7p5fIEydUOflbxADdFbhkpUbJam/eLr/Vpcx5Mq7aM3PWbEPr7INx06Kio9zvfpsaCV7wuftJmiweEiVdSVnrrA1EB/M/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791617756; c=relaxed/simple;
	bh=TVIiJVHskzSYIEzDey9M0ArbAY2a1BkeAfEePyu89P0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aJ9ZZHejAVs9ol+vEn5BpmIVlYH2mccFf6n0PbXTpxL4hDfQ1S18GWgwtkoTcPvAFzjaWSSg8QVhcmsclM+GlihRNQD25UJ+ltdDXm16osSE7BZPwm5czs0yhwutzV1iSluyvg0Nwfdl4IErSu0rVCSjAyOc5Z7hoLyeXVGhYZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XW8/KhOV; arc=none smtp.client-ip=74.125.231.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XW8/KhOV"
Received: by mail-oi2-f9.google.com with SMTP id 5614622812f47-4f47feb5a15so79562b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791617754; x=1792222554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpcc7xlu2/Y07yx6InZaddKVM8WwydxkM9aORRslbW0=;
        b=XW8/KhOVwpRa2CNtHq/mwytnsopj6hQe6A/T0RqZ30BWFjzgAhTTUm82k8EJR0Yqfq
         v4NuyJQkS54UY9Sdvtwvta4LYEHFhzf62tiywClCEwk70X1pH1XsnOj5Onc2C0pmLEKC
         w3DVLk/JCFht7NG9W744/mhHMWBMY+NKXh/ZKMYqlgv4V0xNy+vokqPrGrNAOVsNCvj7
         lgCZodGGjM/YCM39gz2OOXzuBicO/qMXBXqNVDzIZDwoZEG1jxH/1axIQj0+wIUww9tc
         pvcRMKR9Q3YGeAhh7MAQbestpZjxZe8KWbzSTGAXms1rj9L3NxpoM59BC+3ydz3CO8c7
         8Olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791617754; x=1792222554;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mpcc7xlu2/Y07yx6InZaddKVM8WwydxkM9aORRslbW0=;
        b=I42XGJXxACA+M6NHZANTrDUm+qdBh3HtyNASY3OrRV6MBbFKoyrfbnOrTL+7KXWztj
         WjgDruFBH7oIkVNW8Rs85vpgKAwb0wsvCA0rhcbztDxA5mJIAqvXbrUR7Gq627dnBIXp
         H1Jxxi1v05K/3OR+IPtR8RW9VzbOQmIXskxl9DPjkZMk8yNLyidoeL1sU44hiOjIJ9aZ
         gyWkLEp57BxWqY4Be4wtrtCpH9HDkJ5mXcHebLKSX5OPgWMELtwXEmW1NfHJDe3sxFxi
         nKSJOw9VeDoVmEVAyZnEPAEKZYx8zOznSpNHBuH7SocobvEKS9nzjuTpD8800SRwH2/L
         PywA==
X-Forwarded-Encrypted: i=1; AKwUvByrw89zCNwXLXKupNA8/a6AyEK2sm/onkkPYZ0mXnqRUJH0Gt1rRUDRhIkYVMi1t+1DBTNoNrnzrLIjgCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt3qxxjEB+McpaVXeHH9JFNBo+/UfozfuHipc3uPsj+VNvlEcT
	iPOUVrXTJa+3nN5W9relLkMbecyg1OsdQiegnyop+6QlSDjmLiz2bVqU
X-Gm-Gg: AYBFou3I0YBOV0k/DgZ75oPnzj0FudOMMzLNHL55VrJO1blRHhoGkwu2g6O7gRhbaKk
	aeu6ou0rNRP9UzTrQoviAhQE4dkJEL4MjF1ofOonhDp7HDiHI6CZHMqoYrCmpSOmYKF0g7qpFmr
	MvP9Yzj/+1TBmK1qIIf1BJhmXrWLIFqM0R5oVL+vR7U1w3OMAx9ebKcuYYZs8lze5LInSUhwdrn
	qvE+7Xc1nLmZZY+dd7EmKLqq2QiXJkR/YZwKQi5t/8o6nhEzZEgvKWb4YMbHjIa+76ykyarM510
	wcsGrzaXUU69PvglrtT2pm92bdvflXJvj+9U6QsHZP3MN+FHrtmtVz0Tzsny5FyUOiw8Tq9gLQB
	/Wcu4SN2TNhYao8OzHECaJkz2a2Xv9guU0gnWVduiUOgXkyPUNsJQ7kxnpCdRnnojJx1I+lxaj8
	EQPYI8HkhnWYvnkxD7vYesKNq6+Uq6aZBFePtL78QK10oHleOFD6eDgAZ54VX4Xtkiv/HCzJkju
	dcqMzaPPG30HGEs3HwZelo9vK7u5rgXi8wzlA==
X-Received: by 2002:a05:6808:4f6c:b0:4c2:5ac:7f9e with SMTP id 5614622812f47-50c54177a49mr3775147b6e.43.1791617753910;
        Sat, 10 Oct 2026 00:35:53 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c16755587sm4618243b6e.5.2026.10.10.00.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:35:52 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Ilya Dryomov <idryomov@gmail.com>,
	Alex Markuze <amarkuze@redhat.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>
Cc: ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] libceph: fix client panic on MDS message with data but no data items
Date: Sat, 10 Oct 2026 15:35:41 +0800
Message-ID: <20261010073543.2912416-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mds_alloc_msg() allocates MDS->client messages with zero data items,
and nothing validates the on-wire data length against that: messenger
v1 calls prepare_message_data() whenever data_len is non-zero, and
messenger v2 unconditionally calls ceph_msg_data_cursor_init() from
prepare_read_data().  Both reach ceph_msg_data_cursor_init(), which
does BUG_ON(!msg->num_data_items) — a malicious or compromised MDS
can remotely panic any connected client (kernel denial of service) by
setting a non-zero data_len on any message type that carries no data
payload.

No legitimate MDS->client message carries data items (OSD messages
with data_len > 0 always attach items; MON/MDS control messages
carry none), so rejecting the combination is a pure protocol
violation check.  Turn the latent BUG_ON into a connection error
(-EPROTO, error_msg set) on both protocol versions.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: 0d9c1ab3be4c ("libceph: preallocate message data items")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/ceph/messenger_v1.c | 7 ++++++-
 net/ceph/messenger_v2.c | 4 ++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/net/ceph/messenger_v1.c b/net/ceph/messenger_v1.c
index c9e002d963190..d0978c9031a16 100644
--- a/net/ceph/messenger_v1.c
+++ b/net/ceph/messenger_v1.c
@@ -1226,8 +1226,13 @@ static int read_partial_message(struct ceph_connection *con)
 
 		/* prepare for data payload, if any */
 
-		if (data_len)
+		if (data_len) {
+			if (!con->in_msg->num_data_items) {
+				con->error_msg = "message carries data but msg has no data items";
+				return -EPROTO;
+			}
 			prepare_message_data(con->in_msg, data_len);
+		}
 	}
 
 	/* front */
diff --git a/net/ceph/messenger_v2.c b/net/ceph/messenger_v2.c
index b323b61e70239..9ad43214bf984 100644
--- a/net/ceph/messenger_v2.c
+++ b/net/ceph/messenger_v2.c
@@ -1834,6 +1834,10 @@ static int prepare_read_data(struct ceph_connection *con)
 	struct bio_vec bv;
 
 	con->in_data_crc = -1;
+	if (!con->in_msg->num_data_items) {
+		con->error_msg = "frame carries data but msg has no data items";
+		return -EPROTO;
+	}
 	ceph_msg_data_cursor_init(&con->v2.in_cursor, con->in_msg,
 				  data_len(con->in_msg));
 
-- 
2.43.7

