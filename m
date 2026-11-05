Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793849502;
	b=Mk+pHOABjqANxh5E34PSmnvNecur9jSRcmaq2u5yIEPqFejZRYsdZpxKHNWz+PYPR/SE
	 w192OP5Ur63T6oLwDRZ2JEl5gOVxD/WZhDYngA8KreQKeX1NCwUem7Nv0A1RB9TH8Lxbh
	 HWdBb/OtJJU2xQoORZz2lGfnm9bRdVDQkWqOftDMQ7uVP3NpCB+8G++6OCHChpalKTfjE
	 5ThOx+fbSV0fvv7IUAjlK9T9XbvXOzKACUxOF/fOQ+/s4zOB/5bT1/bQp5BphQDxd4BKS
	 zPa5H8FSbjuLvQtj+rExevNcCixg/WZKlVvZHfsd1AknTg6nn9wETCNshvRLu5vuSzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849502;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7We4HPtePV9Dc6aXJUWiMEiPHBDvJVsRffgxKrPc9bY=;
	b=AsK2PdbBZph3ZSAOP6u650gFjvLH3gl9hU10Sr+XCkH//QZJ+EsQ8xon7WcHp2OBewdK
	 frh1oGdRNWYx/TwD+h+zAaOOx9Bx5w6hCluLUP7YrR8w0C1vbQgb40uAHLjhLmnpv/kdF
	 zTbV4v7aeohqENvNuRM+cjmUaSbRX16n1u1VLfUR9MHzkvrLzCemAfFgDzgdlcpk2bM9x
	 YWaeAtru8s3XqYRGwmV7XAVmkMkW1Xx45qk1IaZQi2rvWZk4RzU5ZN5iCPd/g1tOmp2AZ
	 JBNSoHN1MgDtDIDOfJRar6TaNTnKfcbTU1v9DKp2Zfsp0y3aDLSIx1lUSOdvNr2a+JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=NAHCCayn;
	arc=none smtp.remote-ip=202.108.3.25
Received: from r3-25.sinamail.sina.com.cn (r3-25.sinamail.sina.com.cn [202.108.3.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EE2606A33C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71EE2606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=NAHCCayn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793849499;
	bh=7We4HPtePV9Dc6aXJUWiMEiPHBDvJVsRffgxKrPc9bY=;
	h=From:Subject:Date:Message-ID;
	b=NAHCCaynQQ+Pbx2S5YTMsX7d0NxVr0kEC/rcbrjOCqp28Vitxk6rs91gyhijSXY+Z
	 HoORPGh6f3YYOGquBRzHeaKJCoSvHPnfNDM1fv3lAaW7dCR0XjbdSiSKnznkT7qSYn
	 c0QvysB+2M8/VMUTVsLOx5RVl3MyOo4wedScaCKE=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6AEBF88F00000C28; Thu, 5 Nov 2026 11:31:29 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7539106815985
X-SMAIL-UIID: 0434F2A38E4E4EEFB803B1F8208D51E7-20261105-113129-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] [dri?] kernel BUG in sync_timeline_signal
Date: Thu,  5 Nov 2026 11:31:27 +0800
Message-ID: <20261105033127.42105-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6aead2eb.3c6f2eba.20048d.0000.GAE@google.com>
References: <6aead2eb.3c6f2eba.20048d.0000.GAE@google.com>
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

From: Edward Aadm Davis <eadavis@sina.com>

#syz test

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index dd07d128adc3..4d885c8e1d4f 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -320,8 +320,9 @@ static inline void dma_fence_put(struct dma_fence *fence)
 static inline struct dma_fence *dma_fence_get(struct dma_fence *fence)
 {
 	if (fence)
-		kref_get(&fence->refcount);
-	return fence;
+		if (kref_get_unless_zero(&fence->refcount))
+			return fence;
+	return NULL;
 }
 
 /**
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 8df20b0218a9..ad60ad5e5cd9 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -221,7 +221,8 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 		if (!timeline_fence_signaled(&pt->base))
 			break;
 
-		dma_fence_get(&pt->base);
+		if (!dma_fence_get(&pt->base))
+			continue;
 
 		list_move_tail(&pt->link, &signalled);
 		rb_erase(&pt->node, &obj->pt_tree);
