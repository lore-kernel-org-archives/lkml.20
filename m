Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793489749;
	b=cpHbCD0l2IlNtK5famYWB9kXL+86pidSXMdETuN4r+a2cYEUgyU8Mc2+jyftP+uWmiFn
	 oNEOc3nSbQP7ZKB66sgi7Zo/DhsGN9lwZCBmcoqZR3JCTXFixsd46SdwAyXlVIr5JCzxO
	 BhKoJIkgtLAtBla7Das2wxNCNOqG0QEs2Rsln0vyBU7F2FaPv1O+m9eH9DZ6AXwYLEeKD
	 Ne7EsGpasUwmAdcdubF8On4NnT3uYOyVEOUl68iRYEH0uhU2LEv6+wJe7pL85rcWSsf6j
	 9FCZI/D0+9RgDXl56hEbeRR7j5tTY9JkGvzkXGIAnzRlLZVFRSKxqnz+ALJyItRtnBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793489749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U+VmHF669EdNYCUg2DjEuSwyfbsxpcZUE4PFfBDrE1s=;
	b=g75p6nwmtZ9hT71wCW0WkoDksXe6s7tg3/rVR78nx8aLpeqdrN8XIZvQ3VpjTloJv6uD
	 g3aDPT23ML7i+8Vn2m6WP1HOfFR3UkkqMUzZPSOKYTYEPL2POQidr82e6qmiFEPg0zrvf
	 xCsrOruOJFEs+8jFlIQuV/5c9xobD0/v7tvI2EYgRAi+r/lukciGN+bJw+ETIWXc/+965
	 ko5aS214KIN2MS1UHo823ZwBsUmzfY/ah+AI6ntxtfeanGBs1G6xnQ3JYckFFkZHTK4/t
	 F/6Qw3CXr9NFBplFTJezEjdh+Au2VCBqZ9IbVv+kYRsAO05n5o+I10ShLDFHp7K2EUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wljbtXVX;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FD2606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FD2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wljbtXVX
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so1865345eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793489748; x=1794094548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+VmHF669EdNYCUg2DjEuSwyfbsxpcZUE4PFfBDrE1s=;
        b=wljbtXVXbZMCFcNOZBZasEhsvzLDT3TwXsVRWC5kfe5sNagcFMJ8Y9IGhLWE4ks8Cg
         kX79i7up0dWl/SunWNFFsl6pgIXNUdRMYcBLCPDCLP4KnYhcqFz8QdOdkL1WZLaUHkw/
         5hWnJ7DDic1RrRg1Nnccdv/Wk1gOX/gkW6TKtbMlJSalput4y2wfZs3jKbxxFtOj7lmQ
         ZP5fsQ3DuiLlx9bwZyrcsER+p4pldy/RNudVNAjfnpUb/oIfZVaX7zMIVAxbEI39Q5pW
         Vk360dvtF3i4qoLBuv90xnAOwH8C6oHtXBgUqeQPPRou63IO8WdCtKezvpRU5G79cdDA
         blcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793489748; x=1794094548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+VmHF669EdNYCUg2DjEuSwyfbsxpcZUE4PFfBDrE1s=;
        b=IKkzAMvyXAJdP9a9hqRuNUr/kW2EjGDF3CSJjX2JkzO56e6o0viI6yMHNsArj7lrri
         k/+huo5AKeh8w6mmKACz1wGdcKozyK1Ro7jgUtAIo9PUErfEdLzv9/37ywi/CTxfVSoN
         VoJ92Hv/69he9NeYU4i2bPrkpjzguEKql1voufYVlP9s8i03xAqL/ERtGbSOZMxjugwY
         GgNFrCqWs1odK3mXXgx2tW/zIOOYNcss22um5Sv/B9HfAfj1YkKTKcf4oNn3xX77XJDp
         pGgfulNsVz509iGaB1wfCdWsyQajOFp+iNepu6KmjhDi/t4ONBpbqofVkzVkKd2CcdEB
         NjbA==
X-Forwarded-Encrypted: i=1; AKwUvBzFKVYWTihvhMxQHTlUhz9EoY1t6Thphkf+r67e9ssgRO7LTk+XyBoVMlVtkSeuCn38szOXaUzh/yo6f6M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqSC2g8SgjnYUrzmewfLRADzfE/2TQmICAaG2y9D0CVpKyfdkt
	HugjQcF0DPF1M63LpRT/IN5fSiEMX8/0K3eAsYmOwE3b15jm3TTgjruq
X-Gm-Gg: AYBFou2x3L+i8XpOrOx2huhxtZV5RyCBROJmqa9jmo9BMU+HbfteA+SnHJO6Rb/GjyP
	Cw+O7R4nyHLtvHyxtYydP4W3VUSvKrp53GETXPoHYwpNW1w5szJE2ybna/lxOYS/u6UuQOL2R90
	NmOJ7kSqzD+Oj3eE6T5up/gEIg8AjVRKzJJVeVLHKN6h81CJ69wB2bwUYqosdUsWFYTrxTl0zRT
	w8jSU6Teufzl3E4HxUfge6cjOmsDdteeBYTE0jAacxF5qxwbWzJLaUnA64bW2iWUfHq9f6PE4AL
	X0qqOpHDfeHmjHgxskFlAXpQahQtWrnmbkYwaQGZxn2qZpILUFf2JyiTTiBINMGI1puObv/vLEh
	/NFfT0etqf8nxQhEuo6u3EGlZHAJTWPdRSM0Y6U+eAbTgzDDQt+Wh1J5Aq5yh1c3WSSHgchO9nn
	4u00HW8iR2VjAdTDmtpXveVW+qAE2BRMpZyPtXPyRU/ysT4olzSCxqZjGHpCcube4LgIhM7EGnS
	KqR+gCSln7lQP2qzrPi9c412lZLQfJGrk23qBMDTN28p3rbftteyI7eNpSHaF1GogfGNI89JPoX
	anJ+0C2GJEBSBsb0fvuhYqb5oCWOBi94wg+ZEo/DbTbPFYv6MPQ7WL5q
X-Received: by 2002:a05:693c:8959:10b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-36a4207261amr8801261eec.0.1793489747503;
        Sat, 31 Oct 2026 16:35:47 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm24073199eec.15.2026.10.31.16.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 16:35:46 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: andrii@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	yonghong.song@linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH bpf-next] libbpf: Match unsigned enum values when dumping data
Date: Sat, 31 Oct 2026 23:32:19 +0000
Message-ID: <20261031233219.9362-1-dennylin0707@gmail.com>
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

btf_dump_get_enum_value() zero-extends unsigned 32-bit enum data, but
btf_dump_enum_data() compares it with the signed enumerator field.
Known values with bit 31 set therefore fail to match and are printed
numerically. For example, HIGH = 0x80000000U is dumped as
"(enum flags)2147483648" instead of "(enum flags)HIGH".

Extend the enumerator according to the enum's signedness before
comparing it with the data value. Keep the signed arm at 64 bits so
negative enumerators are not converted to unsigned by the conditional
operator.

Fixes: d90ec262b35b ("libbpf: Add enum64 support for btf_dump")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/lib/bpf/btf_dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
index ea9a34db4c00..7608179aa0f0 100644
--- a/tools/lib/bpf/btf_dump.c
+++ b/tools/lib/bpf/btf_dump.c
@@ -2373,7 +2373,7 @@ static int btf_dump_enum_data(struct btf_dump *d,
 		const struct btf_enum *e;
 
 		for (i = 0, e = btf_enum(t); i < btf_vlen(t); i++, e++) {
-			if (value != e->val)
+			if (value != (is_signed ? (__s64)e->val : (__u32)e->val))
 				continue;
 			btf_dump_type_values(d, "%s", btf_name_of(d, e->name_off));
 			return 0;

base-commit: eaae576c34d7e001767b6845a5950b0b8db3e68a
-- 
2.43.0

