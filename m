Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890688;
	b=G3lew6xU6LQIk79hsctFdxw02tdATJtTsUMjwWiG95US9ArswNKHeOfAwib9imaCNVKC
	 9rX3cN6+hz4M6unM60NTgZ40DZesycS0oPGXJjJcuNmxdqwWFBhKECINshfqpTgXIcyrF
	 ApiHNWH6y/+XTEBWZqMxXJ3Oc1087qA1EtoJpWeayJOgPCaJUz1rN4Yf0EcqiK1vPlqCm
	 pg43vhNDzlp5ekmPDG0Uh/Dqa/GVWeLVHyw9Ao+JRTw6hHXVb1myIw0upQjuUzSw5uh7h
	 WN3wRXY4TN9OnIlfIns6BdAfi1KJoXxb2DgT+ouPwftfO83PBWyG+BzcOeHsY+DfPQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3+YAM7QhpxOQ/TxDpr65kj3A2GM5uW8GyQy6B+dSiS8=;
	b=RIqe1yI6y9ny4dnNaE938KZr5I+jloKp8QpguEIzA0qZsK7247xagMvaAxt20ebhHTug
	 4AHr4yzqHTQn23AmF5GrN5JISdfA2NszZInimLLgI6DA3pHaBZnoJedBnuBWbNGrNmOSi
	 yFyyQCZS6vJCUU6Iif/Hn71g3waFWLjnuvOtSwkjeCQeGGjWqxOrkQqVg0/S2jzyWDBWL
	 v++3dfX5pv+HxcHf57Vrna2C3KrKGKQXwjSZz41vjwjVKornIFW5OpnsyeWemba3FC0rP
	 P8fcz4/dzA1A0j2Z0yuX8c9QZsEC3ntM2FQWyULbaof98NO0HiZpyiCA9OEXYpqCEYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=T90a4boE;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31908606EEA0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31908606EEA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=T90a4boE
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-82109f51565so853913a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890687; x=1794495487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+YAM7QhpxOQ/TxDpr65kj3A2GM5uW8GyQy6B+dSiS8=;
        b=T90a4boE8/5k+6Py5Zee+HbM/NqK2it45xZu3y4/mLySHnqTCAgdEb6GUyCTW4VC+Z
         QABdFZwxycsgl/fG0QNyAl3YdzF5xXR4jqgZSO1pYmKWKjxAlkhb9FiIjA3Jq0MzWutG
         PK8oFB8Va3ij+78KaMgatz2RhWq+Kx2XTMXm7QTYAYguYewKUV0MATZ2ke2LF5/Vdpor
         QCh1lnK8wmAfcmBJefdN44mXkMMPFwQeIiA9eGBrQakS0JXCuNEfbL8eYgDWe4wuKN1P
         A4vGpzTO5AXkBQ5P7cAbdYse+chm5isMlVkFXFBMi23uJtuYW512KcPiNP6dUlE/9T9S
         Yagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890687; x=1794495487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+YAM7QhpxOQ/TxDpr65kj3A2GM5uW8GyQy6B+dSiS8=;
        b=zHX1nRAbVQHm3gyAzFYavqjLFbsFfHGppGYIjf668qsH87reuO875st3dfRG6xsyyF
         +wQj2elrl93B4iF6b7i0GGmvkPj6KZuZQYbWpjCo1EgaEgOMzwSq1KefCEbCPgQ7EbfK
         yvgtNHvryjeHDshanoquLTjXEreAwdAgNV2jXVvo1z2I+X7TnKsKaKO3fj2wEg9ojMEz
         q/bxbNjv+1Hlms0ANVFyEUz2jm+fznaSHHZ838H1yZUiRNHBtwMn4ShIuFbnztrNCEp8
         mvkKuly7XMzgHIfUmsxvvxOMjmkTlN4ayDwweGZ0IPOfcxS3E4mPY13GZS8dsK4OPGGL
         xEmA==
X-Forwarded-Encrypted: i=1; AKwUvBwPQOokgZNjYz3YecBNNUdpnZxdJQhg1iqZeQlGdNFFKEf0C4chf2+aKUghd4lXppeYCRhL/HrEZUgTF10=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X/5h6zKBR/AIfgLu9qbIOgcPjluZ1w3ZiGRLGz3TPubNFh/0M
	wCtH+z4jUFzYA6hIf80iOH0HgQrLSF7kVhb9k7X4xXBjdbI/ZUM5grdOOMv0XySoA6I=
X-Gm-Gg: AYBFou3HQhZKdg0RfVw6z0qxwqFf2zZbRRxjQu1JRpPOgeXkw7CSmMBx/UnCTYmepzU
	50AIWO6I8OPBOR3xCqCvbvDQpaCcTXr/TzaN2pJxSiQ4cpe3knGx66Uut5XITvQKmrX0Q4Ay9BC
	WmXqzQ9jlmLfa5YjCLpJn6o2baeuc1OYX3U+wYpCHxYejNnSwL2th+N8cKROEc/uppXAOb43cpZ
	GOts7kOqSWfTRWBrjEBFDQvIccXKC7suhKdmDr17jPaHU9Q5d9AS2vtxehpHdQZ7wAkkEyjEW9q
	5yxNwiUrsGdLrdHy8ldSyOdWmN+Fk/mX3gejAfRgVEVe+gl6TecbcVUDZbjgcjXddpNrMSG6c12
	3w1865vClDzXa5mqoVnoJZYh9DCM9iKD6Ls92GgouvlimqM0IPSIDaDvT4RV6twTUy3Uitm2tfv
	l3cd5eN4cO1auxlfeVIvJBd/7tgyZ9QkpBZ+nyj43oD5EWMbqxCf5Gc6AOwHJ7yfuyeMvgZmm/k
	FN72BlbBW4PP64h0C6cwwxKYldowHQK3A3uhurGbt3lTx21qidx3EQnl4alasNkrYR0wDI+A1Hv
	1E2qyA/T0Vkzblp5GHRCudltiy7FHHCpxcekZnBoupNXcbU=
X-Received: by 2002:a05:6830:2545:b0:7fa:ab72:9e04 with SMTP id 46e09a7af769-85d3661cd2emr14377718a34.28.1793890687113;
        Thu, 05 Nov 2026 06:58:07 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3eb980dsm4803319a34.25.2026.11.05.06.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:06 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:56:57 +0000
Subject: [PATCH RFC v3 06/90] capability: give the owner no say over a cell
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-6-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890669; l=1426;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=UoHgXP5JDNCC6gM9STTkRffOMdSK9X/MpGRKf5Ijsns=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFP+naGFhoYNlRnMYE7wnS1fYAQ8Rx4sgYuZBeymHDBcNvtDLvOZbEaijiKIlDuCqnll1mN2z/c
 N/iQX/tbeRwE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

cap_capable() has a special case for the owner of a user namespace. A task
in the parent namespace whose euid is the uid that created the namespace
has every capability over it. That makes a uid the authority over whatever
the namespace owns.

The authority over a cell is the cellfd, not a uid. Skip the special case
for the user namespace of a cell.

A capability that a task holds in an ancestor user namespace still applies
to the cell.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 security/commoncap.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/security/commoncap.c b/security/commoncap.c
index d47ab3022343..8af343c78d35 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/capability.h>
+#include <linux/cell_ids.h>
 #include <linux/audit.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -90,9 +91,11 @@ static inline int cap_capable_helper(const struct cred *cred,
 
 		/* 
 		 * The owner of the user namespace in the parent of the
-		 * user namespace has all caps.
+		 * user namespace has all caps. Not over a cell: authority
+		 * over a cell is a handle, not a uid.
 		 */
-		if ((ns->parent == cred_ns) && uid_eq(ns->owner, cred->euid))
+		if ((ns->parent == cred_ns) && uid_eq(ns->owner, cred->euid) &&
+		    !userns_is_cell(ns))
 			return 0;
 
 		/*

-- 
2.55.0

