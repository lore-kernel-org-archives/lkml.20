Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586569;
	b=Hv9VMD2XMtrh4XB6c3acUL3K6RunzEsBTb6T1uVNOc1niN88ibxZ6dkkLhIjx13/NQui
	 zizZvZvD1dZ1gblzQnCGpfwZ09Ca+Ooo27Y4xhOIgbBheEeO9Y+ejt7ubL8IjAYy5ef/v
	 j/G93VY/q+BKWhdJgXWm587vSlt60PLckav3qtuX+PjjwsDbEPiqIdneEF0s+kjD7L7UD
	 zk8sm7wXye9cMJ7mf6GV6olqV6ssMEQBHdHvAQcuatoKN3s5mlHMQcXzuxCh//tOAYS7n
	 RjXmVXX7G06Fs+XNIqphrc6Ey4h9jDjhdZKyw4hwS8JvcSM+kY9bw3ME6GVR5KWiA5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586569;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i5QD+mD9TS7oO5gLgp88KnKm53WYpzF1pq762j1kjSk=;
	b=hT5ye0OczjJgIoeBFLlc1TmBHmbKIthXJ6wMQMrEhpx6JfKiRS0z+Yx66JX7/BsZy+I9
	 ZZvix1dbYQHUzEFFtChqDMjLm5bfaamQ0FsSzsT8dMsHuOkS3i4SY7epSXypQpB/6mooE
	 dj59oXeeuvTOuJ7PIEt8NVW9zHMeIbKLlWUIF8WyTioT5RBqXP7jSztnQRczgic5AxVYr
	 OrNbMIIEHCDeoHOGjNzTfxkZiULsXtBFNk8QJHvUhBVqrKxSgwjbRqIi2vnO6MKV7alll
	 Rw80NOUWPRz2GemdiRYoXTfy0r74fWOQz5jPdXs2H+b6Xu3Rpx7yvWHKgfqk+gD2+Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fdb9M5Ny;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939F8606A32C;
	Mon,  2 Nov 2026 02:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fdb9M5Ny
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F381F00919;
	Mon,  2 Nov 2026 02:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793586569;
	bh=i5QD+mD9TS7oO5gLgp88KnKm53WYpzF1pq762j1kjSk=;
	h=From:To:Cc:Subject:Date;
	b=fdb9M5NyWyAtnm2RzFaPn5/5uRvZ/E3HmNxOiod10VDARN9fw1TXBXuxX2vdedF2I
	 ZBYE1ElWuVwZ48V1cOHMyqXn77t9xRzXTXoivYOVLL1GaVS3tOIz1KfXYjG2RBsUIM
	 xobshgns1jGXL2XgSQRWS4LavLKdg/y9mrOxvNeNRqIPK5DxD3rOLh9m6F8k9537pR
	 1HjANPZZSltAL049cHjapqI2h7mqdNlcxW0Z4/dWKLwH9NQxTg8KHNHXMddic+JB7i
	 sYZo/TkceyMzrsYDS/h+CH0CAHsfVY14F4ytcTgkOHpggLvcIaAFEN/L4fQcq+Q9wy
	 jP6y0Ul5khu7g==
From: "Carlos Bilbao (Lambda)" <carlos.bilbao@kernel.org>
To: akpm@linux-foundation.org,
	corbet@lwn.net,
	danielmaraboo@gmail.com
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Carlos Bilbao (Lambda)" <carlos.bilbao@kernel.org>
Subject: [PATCH] MAINTAINERS: remove bouncing reviewer for Spanish documentation
Date: Sun,  1 Nov 2026 18:29:22 -0800
Message-ID: <20261102022923.686974-1-carlos.bilbao@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Remove Avadhut Naik as reviewer for Spanish documentation. Mail to
avadhut.naik@amd.com bounces with "address not found". Translator credits
in the .rst files are left intact as historical attribution.

Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61bf550fd37c..6dc3e86c5bb7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24843,7 +24843,6 @@ F:	drivers/i2c/busses/i2c-k1.c
 
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
-R:	Avadhut Naik <avadhut.naik@amd.com>
 S:	Maintained
 F:	Documentation/translations/sp_SP/
 
-- 
2.53.0

