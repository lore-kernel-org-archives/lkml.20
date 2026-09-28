Received: from mail-lr2-f40.google.com (mail-lr2-f40.google.com [74.125.230.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB203CF202
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621958; cv=pass; b=OI4L3RcGgMSUB7/Yc4YNTPrNBtmwngcnUf4fb9SrPaTSk9r3CK9I6VKL2iyikBxEO2WlQ8oQXcKcY99iubOJ8TAAOwptCnX2HkebgvXygvjDwU5OGGSF22jea/sieNxShcZKezUx73nrHJQad8dy22LI7p63aMfG5R1ve/cQkXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621958; c=relaxed/simple;
	bh=38U1s8GZuYMNUAkuLxbkuCyOG+w/gVbAI7eJbWfyuKE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sHEpmoF9jw7wj8orCdGQWmeNZhNKnA7DSrt+44yJTnTofmjfQA36PYHFYI23Ets7fiTEcltzDqES6m+XsfeRRgqP+ooyEmY8r7oueK9zcPxPto6vJKsbKnGLLSY5NHhpO37GRSSl/2R5XOS7v2YQnTsmGF9hWPqwFkWuERMsuas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkVMQ9Cn; arc=pass smtp.client-ip=74.125.230.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkVMQ9Cn"
Received: by mail-lr2-f40.google.com with SMTP id 38308e7fff4ca-3a5da7416f9so28611871fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790621951; cv=none;
        d=google.com; s=arc-20260327;
        b=pgA+NrcEFDXGc/xIWyqpf+t2ljRU8ysDX+ySSDgD9IrJsGHTPIpKMri3JgT8fxzjS+
         XmZ7hrI380/a+UPI8OPgvLrv8Dgrgh7/XplF6FT0owTKtTj5Jkuo3/mIW4vU3acJgENA
         9VyJRLB2viuymVbWZH0wS2Ru0G17H4O5VnQPGFNszF6vwt7B414eWQHJ2Ag+jRyHatbp
         0X6VU92N9nmdFZMynNLtS86ukYzDzg76AyN/hgOYMBhOuWcEhBI2vMdrxU2b5Db/UgC3
         s+qNhzKwHYnOkPV0RhJ0M+dwrD7bOKkSP+nPPxgaJ3aGqm8YA5hE1DocWFCPNO5UTn7E
         cnfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:sender:mime-version
         :dkim-signature;
        bh=JJn4UyQhX96Z2Uxh80LSoGTD5a8DL5VMxaJOGjyTlhs=;
        fh=+M7RU9iKLg66BKQSUSg7B4M8r0Bhjw/lXF0VpYZboi8=;
        b=cNQCN0+zg+QsyM1UAASyCbsVwy0M4zHk813YKPaBCUe5MfPEyd3k8wtaf6ZbV37DvZ
         +ta1Gn8f+ldVWbg9ACY9poDgvJV3lrDabqYDBfxm2GUEt8hmuLT/bnsjFOi18yajpoV0
         e+U6Jux+Tr3AzXTSc3pb1kEy9z6l7b9Q1j088g+VRItszKylYKr/PXUble5SyjLn9JwG
         8ETUSwm6cnQADEOGCWZuoe7DP6WKlbo4bfmaB7vduuwR4dtT8xyelhIeQygo1hc1gDdx
         IDKsK66VpoyXf8oaVgn8fVoVbefVwNj4EsQFo4cy5GQRQjJItBrR8Oj7TnoSq+7r3F64
         Lytg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790621951; x=1791226751; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:sender:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJn4UyQhX96Z2Uxh80LSoGTD5a8DL5VMxaJOGjyTlhs=;
        b=ZkVMQ9Cn4o+jeVoWjjCwmq9CPcWR7/mF9yEG7Ns8vm6qxN6Zxr+3S2CeeJ376BXJtz
         GVXAUUQC4m9e5XNrwD3kDMHErMmhNwdXdhjazklqN4PdGNuPuk5BjCf3IriVDoTMLJEx
         YedorAfXg4T0qn6IGn3W4qmJpR7e2meojy9B53opjP7/4gbT2zvFH0vZ4ovTuE5/0owt
         by/DTUHfyIoqxLiBI86H8+MjOqF2ySzbHzAQ4QmIBaPyzkHysb1yUPMCvKOpXOEWIdtP
         fWttTVU2sH5IF9JhWLDO1iSE6HlySw/mVz+kv66d15ZLkztjyHkh9Oo3fh9BKIXMlNCP
         oWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790621951; x=1791226751;
        h=content-type:cc:to:subject:message-id:date:from:sender:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JJn4UyQhX96Z2Uxh80LSoGTD5a8DL5VMxaJOGjyTlhs=;
        b=eERzMtW9kSd78KfLvdPBwvMABY84YBx6KPuNe9JtyDjla6X7bSivIS0PBTAbIbpfID
         1gYLw0npgItn2atAE+hbNZpIK+X4Bj7j6LjUklTcNi2xEoESSwd8L2gtfiDwr4wG+JiR
         VoM1vsPVFnkDlX7O6+WDy5A4IRurjLLKKxuDBaQhY7bDeNv5FgFgDj6Rm8myTtGmJSac
         avNZe9cDynNg/rQ7KIlphLTQ9/nBGBeMTS8AJTL4IqEIdDV0Dk3eyN0s2ss3ZiY/iAbC
         IeDCFe2pM06v5u/u4LLJffwZJQ5m7jJ6y2NwwEOBX0Lg6znbHhHxdqEHOz01HK08DLZL
         qOfQ==
X-Forwarded-Encrypted: i=1; AKwUvByRV2BS27LGHgTbxtpsMDs2pBPiim/IC6swzNOe2zrOSIlC7nKR9utUbYkJlFu3J5nzyhajrs21BuBnfho=@vger.kernel.org
X-Gm-Message-State: AFq9FYJygMKcs/C4wGDZMFLsymyHR0j0kvmMVz86z/nhYFGxP46HssNJ
	91G/d/FOW7CmTg8JAlKV7ZeUbOoI4u/D7/TumZk3y3R0QZRuDznWUret8bpBbiSHuHM6YWkFPkh
	Q8//odfWJKgen76VMrr4Qi1YyUI99q7A=
X-Gm-Gg: AYBFou2R/dyiH3gdIR6XV6cYt+Z9DNnzki0x2Rjpcp++3y+96tKR0sLsQPoDrXe+eDP
	nGYEjd8k/h+nrG4J/QqVZLt2kLBDE9R7alqYCd0BrY4p+cIoUCAA2ByBO7JcsAbBi91XxUTQrgm
	2aVCGH6iYTZZ9N3JTqldGt3v5hgNhq8jl57eSAArDZ6LxdmUtZGcyUa8a/1HtUw6TsXC1xUYgUG
	+rL9sOxBmj1eZeH03XxG7l4gJM1JEoMfNjEOJKC4ixT/l59X9wy0sr0bjzGwWiWmqxYktVdLu1n
	j0ZObX9CcEd6C+fyNw1g7WAzHVUoiW2FnK5aY6zYmWFwddzt9QPcM4Vri2Bn0/oDoF+4GunKYva
	HOURmmF2H9zSI
X-Received: by 2002:a05:6512:a87:b0:5ae:bd5e:95f7 with SMTP id
 2adb3069b0e04-5b8df0d42dfmr4907670e87.4.1790621950890; Mon, 28 Sep 2026
 11:59:10 -0700 (PDT)
Received: from 254448290189 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 11:59:09 -0700
Received: from 254448290189 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 11:59:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
From: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
Date: Mon, 28 Sep 2026 11:59:09 -0700
X-Google-Sender-Auth: bfjEdBcSXwRUi8bLWiPkOvkvDYo
X-Gm-Features: AclHuK8baSSkZv-tT7IrQBt-8uVkNNdEXmB5RveGyZwqKIXYr-qkBIj5G0AoAGo
Message-ID: <CAANnmVAicVNhy8fMUaFJ_N+b4DnbwpYi1MOL4yMVisix1WCX4w@mail.gmail.com>
Subject: [PATCH] net: ncsi: clamp filter table counts in GP response handling
To: netdev@vger.kernel.org, sam@mendozajonas.com
Cc: fercerpav@gmail.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	gwshan@linux.vnet.ibm.com, joel@jms.id.au, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ncsi_rsp_handler_gp() iterates over the MAC address and VLAN filter
tables using the counts from the Get Parameters response itself,
rsp->mac_cnt and rsp->vlan_cnt.  The arrays it writes into, however,
were allocated by the Get Controller Capabilities handler from the
independent rsp->uc_cnt, rsp->mc_cnt, rsp->mixed_cnt and rsp->vlan_cnt
fields.

A malicious or buggy NCSI device can therefore report contradictory
counts in the two responses - for example a GC response advertising
a single unicast address filter followed by a GP response with
mac_cnt = 255.  The GP handler then memcpy()s 255 MAC addresses into
the 6-byte kzalloc()ed buffer, a heap out-of-bounds write of roughly
1.5KB of device-controlled data, and the same applies to vlan_cnt
versus the vids[] array.

The loop indices are additionally used as bit numbers for
set_bit()/clear_bit() on the u64 filter bitmaps, so any count larger
than 64 writes out-of-bounds bits into struct ncsi_channel.

Clamp both loops to the number of entries actually allocated for the
channel and to the capacity of the bitmap word, mirroring the
validation the SVF and SMA handlers already apply to their indices.

Fixes: 138635cc27c9 ("net/ncsi: NCSI response packet handler")
Cc: stable@vger.kernel.org
Signed-off-by: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
---
 net/ncsi/ncsi-rsp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index fbd84bc8026a..fa1ed405dfbb 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -883,7 +883,9 @@ static int ncsi_rsp_handler_gp(struct ncsi_request *nr)
 	ncmf = &nc->mac_filter;
 	spin_lock_irqsave(&nc->lock, flags);
 	bitmap = &ncmf->bitmap;
-	for (i = 0; i < rsp->mac_cnt; i++, pdata += 6) {
+	for (i = 0; i < rsp->mac_cnt &&
+	     i < ncmf->n_uc + ncmf->n_mc + ncmf->n_mixed &&
+	     i < sizeof(ncmf->bitmap) * 8; i++, pdata += 6) {
 		if (!(enable & (0x1 << i)))
 			clear_bit(i, bitmap);
 		else
@@ -898,7 +900,8 @@ static int ncsi_rsp_handler_gp(struct ncsi_request *nr)
 	ncvf = &nc->vlan_filter;
 	bitmap = &ncvf->bitmap;
 	spin_lock_irqsave(&nc->lock, flags);
-	for (i = 0; i < rsp->vlan_cnt; i++, pdata += 2) {
+	for (i = 0; i < rsp->vlan_cnt && i < ncvf->n_vids &&
+	     i < sizeof(ncvf->bitmap) * 8; i++, pdata += 2) {
 		if (!(enable & (0x1 << i)))
 			clear_bit(i, bitmap);
 		else
-- 
2.47.3
