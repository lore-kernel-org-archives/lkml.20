Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6206B355F47
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121607; cv=none; b=Mqj94psoLreGllGiCiaf7ORDeDa7qqnqDvy2JnXBzWYX4K5xZdk2nYiuEyiVXNHYwnwYk2AhBfckfoavwVeAad7YNqFTE5j/X8wblbcUwA1Hq29fB2ch42F3p4RtP2MIm8w9HPReLCxgrtASyup940I/02JiJpQqO4qlpgbiS5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121607; c=relaxed/simple;
	bh=U7GvpQhbtLaoHs/lFWHGlyijPugSbuv7vZx6NLI3cJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r6Qp5qQDs5ceLPtnKomLX3I1s2TY5Nc5iZN6NXMPlFIkfkKKOsVWSVLF0At7IWZiE+cKWkzkdetKpS45DjLov6QwMTLVOzWZZrGL8qHRf6mOkFUCW8/Eh5YIwSVfUHf87HOkoZhufp8iubaKTSAcUqhrpD37cj/bSJXDUJT9DRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhpNkNIo; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhpNkNIo"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d45ae011aso6414287b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790121605; x=1790726405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZHLM5NymYYAKNdO5FStoNLYHnA84bC8gfsPczmDe5k=;
        b=KhpNkNIoLj+0HmvyGaIs+/tc3ATDtHQQIvdHPcyxhspVUXqk/8bOg9Hl2UHGkw38yR
         vFhHE6iUh76D1tFsxFEgeFf/b26DPlDy5h5kDYigXZ15b0hnEPwz8fPWitMN5GIHEyFb
         rrldrpW8cbpiEXcqIHTsvKu0VzkhXQke0njiGX2vW2O/odXtHiXcpbBbbeYXDYdURi6h
         EKArKbgqBN72VIDdltOb4Ni0lzR5FLLLKMiG2ezvDyZ+hdi6r3Yu3Tj0Bi29SI0VgIuX
         6p2UAQBI5aqGDZ5Ye5SocxuFrGSENdRdj9yxyhCjTsIMkwbdsPZJ304F2aT6lc7+kR65
         6DUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121605; x=1790726405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZHLM5NymYYAKNdO5FStoNLYHnA84bC8gfsPczmDe5k=;
        b=mxSvNs5X4enITJsriJRyIxGHc1ytGjUzl20gvmCyQLo4mT8nL9BeWoFFgvLjsTDIid
         oDhDe5k1iiHhffrokbiBRaltONBSojF8X8wBC83W2t5oP3wu29iq+ym4GSioTltpdjcE
         JaFfE7dUAs/bbNQAgkEfNQoVEyIiatIzg/S7/1GgQ3TuLYp/GzXBAZPPlB4imobLpBi3
         3oWVgBFNv3e/4vweiKOZYsC23xO/RXE9GkHEk91oboq7HFXIJ6gSKxX44DJjgzsvMD3I
         Uc0GwipI9IBC7JXzNHe9oheYLQWjtJUmgluUYR17fzWCcm/0GTNGblpWZKNKz53NEYIA
         syTA==
X-Forwarded-Encrypted: i=1; AKwUvBzateO/1ngn71Sxv8Ts5mn5+XnCbMM50iNAhac115orur1ReVo8sF5GimlRETqhdy4vV+vV7F7xv07pNsI=@vger.kernel.org
X-Gm-Message-State: AFuF++mWRim9wOyUncdpaOv2qUS3Rh8LaXHHIe8dCIvpLrrjysYQ3lvr
	Co70oOyqlxPJBpb9f8e+DVLK2mw9iNvF3VfqnIQSgoLgnWc5aUYCSy8=
X-Gm-Gg: AYBFou0fVvUNFI3POXooS3mdL1bvy0DbNmy+L5wynHaB37D9gAHs6NBnsTBvfaALNsH
	tXPEFUeIbFYMIuhLLTKHZHINUZqbLa+DH09NOCt1pXfiKtgLrAOb+ohbdnzH/RmqfyXxMfHaAWO
	9BToh05zpxKopUioasfwYO+CoV3j3YjNsN2IBPltEQ55tUTsruQH3HXs8CjaC991xuLS6G/tjag
	cb2ZuChf8n4IrMNdvOlKrPosB8xyEaQ76w8qtPW+f8CF3Nrbz70B5DWeg+ukver5j944B52I+Dd
	pD6uHhSMsLP18B/EIxkemBJQaAV7IkCzptHYsDlxW6TTRAfJ5v3FYFG0HX7oVMC68SH8A7fimGq
	ZPN0BY4QAGXN7gauWLSbiV37vG2CKHBbAwwADIGYcWNgwNd6C9BSDs/RLl6BE/fvJkXJPJVo6JO
	+K/IJfrzdZ7T1YhoU0CR3KIn7DNhKVfpuR2b43wrw0XZUedjceSiVqfD6bjaagUJJ/pss=
X-Received: by 2002:a05:690c:87:b0:89a:63bc:8ca with SMTP id 00721157ae682-8a45c45fe6bmr5719237b3.84.1790121605262;
        Tue, 22 Sep 2026 17:00:05 -0700 (PDT)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::3c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a4662b8293sm3850407b3.29.2026.09.22.17.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:00:04 -0700 (PDT)
From: Arav Verma <svav2021@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arav Verma <svav2021@gmail.com>
Subject: [PATCH v4 1/2] platform/x86: intel: wmi: Use sysfs_emit in sbl-fw-update
Date: Tue, 22 Sep 2026 18:59:53 -0500
Message-ID: <20260923000002.1799245-1-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modernize firmware_update_request_show by replacing legacy
sprintf() call with sysfs_emit. When altering string,
corrected format specified from %d to %u to match u32 type of
target variable.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
v4: Added missing Signed-off-by tag.
v3: Resending as v3 due to git send-email formatting error, no code changes have been made.

 drivers/platform/x86/intel/wmi/sbl-fw-update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/wmi/sbl-fw-update.c b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
index 62c9c7f1842ba..cfef71f4f3284 100644
--- a/drivers/platform/x86/intel/wmi/sbl-fw-update.c
+++ b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
@@ -61,7 +61,7 @@ static ssize_t firmware_update_request_show(struct device *dev,
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%d\n", val);
+	return sysfs_emit(buf, "%u\n", val);
 }
 
 static ssize_t firmware_update_request_store(struct device *dev,
-- 
2.47.3

