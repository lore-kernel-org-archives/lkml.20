Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B72C3C9EEB
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970490; cv=none; b=LN+6wROwjvlWs1NlyrOVATmpU9cigywz2RvBJubMr9zVl5lzPr7OAF4zc/bM0s5qVE9E8vrgF/DIThVpcT3tecagMOLPojStYatcg/g6yFusTF8+NrIs5MGm8Pos+btTyMmAOo+zjrFzda6ebNBzdiKdSduLLek4gyN2IuQOJvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970490; c=relaxed/simple;
	bh=uVgA8Jj+858NUjqFixCzSRT/djaE0C2Wg9YqoiGWV9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vrk5O1+ZlyNBBoagg0MRPSfBXSjhX+3rsnfLTuVsP2Y6vB7CRzcwKmAexucsvKFJ85hQ4ly+RRU0s9b0ZtnIRM4pcuwu86PjNudeFhpmBRo7VkdLO8dC7Xds60T2k3chHVlOylA3KT2+OESWwcW0A1p63oShpcSej83xC8vE1MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIYFrnje; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIYFrnje"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-9178d514951so1000486d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790970486; x=1791575286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=doS8d5OZpw1xxXeF9uWp+A9weIfqE/dyEXBrkjrl1wA=;
        b=SIYFrnjebN6i2h8BV0w4ipVJsn3/C8A6j4N/VObrU0vndp/0abYyQYmDME2Gxu1t8o
         j5+PmtrAoq7y4Oiiw4yrXu5qF4v3cvSE1wzwN1v0xjg9SEf49u4o1CerJFD2kJlYIzXS
         B2fxTjC38Y4BipERY0AiQm7tc2AQLGQATITtVzrKKJU3pKtK4p67nhMs/r9FHBz2SR5D
         /JhDAfFVXyK0/ZEOxmMHv73/cCyxA9JYqyIpyDfbw1vmmEjcy0sij+2polc+/DrVC5uT
         if5Voa/lVaEkNvg7oOPJb9gdOo1uObsNMuq3Ka8KM7CSDfgaSepI+IpaBisA7AfVoLZ1
         Vcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970486; x=1791575286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=doS8d5OZpw1xxXeF9uWp+A9weIfqE/dyEXBrkjrl1wA=;
        b=mrXYx0GO9RPBX/nz8hZdIJp74RtbrIfqumJz6ZSDehSFZl1a+gus4o9Wb5l2kaEIXp
         v9er4qRkoXb8JKz9ZZOIW1KeEFpibW+UEpXsIh5XMpr9xOVqQZmwTBJ4thZDibZ8oQSG
         /2tK5lC0V8ijWdA5+kJlJSEvgI+1mj4Awy8np+761Xmx3v6Ug7tdt2Z7UquDDG9WgcaG
         /u/rNF4tAshOeomLJxftHJMUH+4l8Aho+F6eZ2mUiblgRkZoaMFMP5C8NnkEFXAbgxsZ
         dUsJBHI1qGYp9qPa9MmozsfAI2yKhR/gg2cfAgjwoyX4sEaRtgMVJ+Ukk4RA+CNPfnIf
         SeAQ==
X-Gm-Message-State: AFuF++mpYi4iwybZPxAec4/mY+91PeC2V1lpNgeLlWXmsL/OwnlLr1fu
	9k3Zk3vAEJ+8qYOoELCLoquvTAEx++tkycjV2+SZ1XRWam5L3MDjie8=
X-Gm-Gg: AYBFou1Tc6TaNfoCWeH4FEddBzT5M9x3A6X7RPnrrlrsNlmT8vL0QlkJdIAqw/RFizZ
	a3uEZ3AAQVCKnIU6yu86PkfpwxbzH08fOCP66W/LjUKSOLXnt5zExxQhm5klK4VFnD9m/IRQ7NT
	PL4HPaF5e2layWMsIwij17z9DLk5yFoTh4aNxSInpcFfkrGQcjd8lOQL3ph8kHuGOOLad6Vt96P
	NRLnBJFFd/glVsSgF8cBDoFpweYbmcXfe7snjaI2Tie0KqskR4tJY8F9sKRQkKuE8ukDR0XICrv
	LYqL7py7DRZH8+TdMiF3X6sfHjTdBFlQyuD4FBZ2/WJnQ3zYNZh6o4DgLUrqVReHiAINc+utoA7
	kWKbvdiUExVEXrfkvlR78csclnNSSyLizb4ZHhPt2n6vedrBrchUIpZkIx0XOni2tR/+Qc+Mn/d
	Td1MW3RDhXfEDdTGEN2v9uRAQd/x5cLgbb7z0PdKBinCJNGTNEXL246phzTS+/wBprJUyySji0h
	5BVL4hXz3KtXfcbw89V7JPh5WPbuRJxQADPWGvvOAwwVSn62TNTIXIzj1VNsDYd33Vg9byf81i9
	ILmQa+p0C+6k4GFQjt61EBSZeA5D
X-Received: by 2002:a05:620a:404c:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93e51081bbcmr76979085a.45.1790970486211;
        Fri, 02 Oct 2026 12:48:06 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2ed5e2sm296846985a.47.2026.10.02.12.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:48:05 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	mhun512@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2 0/2] soc: fsl: dpio: Fix IRQ cleanup during probe and removal
Date: Fri,  2 Oct 2026 15:48:00 -0400
Message-ID: <20261002194802.375497-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two DPIO I/O object lifetime issues during probe
failure and device removal.

Patch 1 releases the I/O object when IRQ registration fails and removes
the unnecessary unregister call from the probe error path. Patch 2 frees
the managed IRQ before returning its resource to the MC pool and before
releasing the I/O object during removal.

Both patches carry their respective Fixes tags and are marked for stable
backporting. Patch 2 is based on patch 1, which removes the probe error
path call to unregister_dpio_irq_handlers() before that helper starts
freeing the managed IRQ.

Changes in v2:
- Present the two previously separate patches as a series.
- Remove the unnecessary unregister call from the probe error path, as
  suggested by Ioana Ciornei.
- Move devm_free_irq() into unregister_dpio_irq_handlers(), as suggested
  by Ioana Ciornei, to keep registration and unregistration in sync.
- Add Cc: stable@vger.kernel.org to both patches.

Based on Linux 7.3-rc3 (fd73f4a6659897191fa0d40695fe370925dd3780).

Myeonghun Pak (2):
  soc: fsl: dpio: Fix cleanup on IRQ registration failure
  soc: fsl: dpio: Free the IRQ before releasing the I/O object

 drivers/soc/fsl/dpio/dpio-driver.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.53.0

