Received: from smtp153-168.sina.com.cn (smtp153-168.sina.com.cn [61.135.153.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04EC385503
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611749; cv=none; b=HKpiQqrKNpZr651aRsuVOJdJaYL+WaAcMy+5kO0ZQNGtRnePUMClJ341CBrvHCCHmUGRsiSg4Bwrk/N3MWPq7/Me5Grt7nrLzg8QNK+oOhhisAY/GVLEr+VsTfN0M/wR8o2rHvpgJVYKAfKtAcecqiBRJ1nvWSlpcCPp84agpdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611749; c=relaxed/simple;
	bh=p17D1FfwjYiNalCM2xRlJA1BhxtoWDTiCel+YvdCYWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PY7ekvjbLP6EwkmZ/+gk/vbDIPxZfnhpgPfBPaBFCv7++5zBYvc0g5EV0LGW6zMGjQx0Ngn98pvekR3kXpeBzNksa3uDhxByaNfyfBRGww40C+eCvG/K5B3GL3uPxttnTtycH/xOAy6LwuKL5wTptf1nUEpmfz7D/L+wsz1DiSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=jbCDkEAs; arc=none smtp.client-ip=61.135.153.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="jbCDkEAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789611742;
	bh=6499mP0TvnNW82APDOqOJqcdQbPTGRc4JDjRgr3TQCU=;
	h=From:Subject:Date:Message-ID;
	b=jbCDkEAsY3IE+6za9LcOkueTEMVnGku/HgplZl2++drrfWaJJF/CpYx7oiuydw+Pg
	 r7/h0rhY1JW5wm/ZzRlWJ45+OcT4ffJzQMEvb6ir6GCX5xfsQ3I6B6jN0DomBpDFGb
	 tONtyxHPdoPhfeJaDVln8DeuWi1JhKWtQWiOGlaQ=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6AAB4ED100001F7A; Thu, 17 Sep 2026 10:22:11 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 081236685257
X-SMAIL-UIID: 50260D273A284C35AD221069EAD133C3-20260917-102211-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
Date: Thu, 17 Sep 2026 10:22:08 +0800
Message-ID: <20260917022208.977393-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aaabb70.86093f18.33004f.0003.GAE@google.com>
References: <6aaabb70.86093f18.33004f.0003.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream f6e7b42bf05b

diff --git a/security/keys/user_defined.c b/security/keys/user_defined.c
index 6f88b507f927..6bf3e2da7bda 100644
--- a/security/keys/user_defined.c
+++ b/security/keys/user_defined.c
@@ -61,7 +61,8 @@ int user_preparse(struct key_preparsed_payload *prep)
 	struct user_key_payload *upayload;
 	size_t datalen = prep->datalen;
 
-	if (datalen == 0 || datalen > 32767 || !prep->data)
+	if (datalen == 0 || datalen > 32767 || datalen < 4 ||
+	    !prep->data)
 		return -EINVAL;
 
 	upayload = kmalloc_flex(*upayload, data, datalen);
