Received: from mail-vs2-f35.google.com (mail-vs2-f35.google.com [74.125.227.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F40356747
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116384; cv=none; b=YplDO5MM7nq16lnrWyWGAla/f6LpHBwAOdGJsk9ck2nUd1Wdn3xJuY+cz+FivPJ6kLU+xDPe74rPffuOdhvUwWS+/3JKwMEUJ42Cztz7VXIQ5GsMy3cySW5nNPCERiC20KdJeVdtP5casWrTInURAlckxBVHOqUyoFaHGrhArZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116384; c=relaxed/simple;
	bh=Hnu+pCMvzuSUJgWSfCJpYPyMsCbRc7B3l4busMwVXGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c6mmwu/GVYy7irdTrp3+FQQlL3YYv8cC84rCNzK8o6vvf6R8czavSG2wtTghzoWDn2C55X0Diq9GSTOOv3zFQuPOfcZkjUtZ5zHXV9VGtqpEo8tB5Fa0VzHwd2IXG4AlGbnLMpyZ/nF2h1+YJx0kqsk2VL+Lh3cAAUaeFWP84uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMl6wMPB; arc=none smtp.client-ip=74.125.227.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMl6wMPB"
Received: by mail-vs2-f35.google.com with SMTP id ada2fe7eead31-7c0fc865cf6so472801137.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791116381; x=1791721181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxtxB8N5X48tB0UW8tHe3MMy98DMVpxgLXTv+lNKsPo=;
        b=oMl6wMPBKbeLSZRNeV7SsFPqyoKwd+mALSDrD12VAH0bpwKBFZQtYeGE5OHFt0+p/o
         m1MiJUxVLa8cCy0iLHrKdM58x1XjKbDTNQ+srEw5WZ7n/H3e6fWN4IYbom9FLIKmz577
         R62QJgp1lXwaSIUA/oGG+j7kQDxAYRU5gLZ+iXS7fDsuRAkOHxnS5zlqwu1BBQTZNHQB
         Ex/WGBvruENYkNuEmI3uK9E2ErqfQTUi7QgIorBw0PJOB92ACPcXzpTueTOw2U/myNgn
         Rb/nhR9y1q3RPhgtV2Onv0PS8FH+NeZmPuXN7uwA6lCrMUfHPT5eJCYzjJlwhdVQsZ/x
         jSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116381; x=1791721181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxtxB8N5X48tB0UW8tHe3MMy98DMVpxgLXTv+lNKsPo=;
        b=cCscUCEPFEyuI8jzACF5BzOSelGZOHxlISFZUTV2wrF8hBVMhh8xq1PGz3um/5oqYF
         amTE8PE/qaXUh3O8QyhK4U90V+c2FP0zUhizCfiT7ArHygqWiTaFE26vkqfsr1HtrLU0
         3p11gY6rcKHS7gMWc984VDxVuL84C/BWNXqESwhGEFQAsuX4EW2DXNy8n1gH/SYboSIp
         zBJbvD/MVrMLnikLIGYn7pxYyaWX0Ei90R+BEuGDyqcRPK9lcRKW5tSN45qUBDyvLJH2
         zJnv5K8pt9/n9Ev1arRncKxysnykfDgBaEkylL08tvuy/LyCruP72TjgPrID6l66gp4G
         Fvcg==
X-Forwarded-Encrypted: i=1; AKwUvBy7jlXIK7qk0Od5JiNbxkPs34CL/x083l8Ea4G24prNhCqIS6eJcir7toX+MM5acRXc/6X+7GGWv+uppRo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmQiKd3V/2//IsjOwC3fTQ/Wd+6UTsKTWRCYZ3Y1trCLH4OeVu
	kYhKpC7vSySRwdaxPInUrnDeokDImYknQc+dBqsxOTWczg6PNMLw1GRd
X-Gm-Gg: AYBFou2mYDFAiTfPuRdizsmQBFw7yu/bJvKiNZ7HgPb39ZttoN5DnCDHZtFChGpthZI
	6eXAD3FKukUa5Xwg6fDqaTVFhALHkmrIpyBeJ/pMnnRaDZXZeZGaUVfssWt8C6t1082YT0D+mzO
	colhpGCyKnGuC0Z2w0Ex3kids2DYUmG78GHCM341zSrL5WlkT5AEsKdNQ6y70qfPIUQrIK/iQJy
	KxKrqH712YEmfJeF8nGxAkdlqioRgarW24It2jOR44jswEUDPl5cvqKPgrBnDDuklBJ33Y3IOKa
	b9k5kLpGAVt7njl8S3RAIlcMaX+fNRPUnDrgZHWCmARSfGzT40Lb5uMr49Y4accCvOBAfkgy5Iv
	maQEcaQdkhlLGzVd+jNNjAja24qUUGa8loLryC0CNOsPVNfWayZxj+gddAfi5alAEcin494nvVi
	p4PZF+VUDUbsYUu1mrOYYwUyq70CJl7jnbPHnck6hpxecEErOODqaBCRvA1vk2e42wEUD7Bh3tE
	8dFThXdWHgFzl+9BGnOxe2aUMDNliyo2COfubJzd4tPmQ==
X-Received: by 2002:a05:6102:508a:b0:7bc:1de3:39b0 with SMTP id ada2fe7eead31-7c0f5dab54cmr2257004137.32.1791116380675;
        Sun, 04 Oct 2026 05:19:40 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a800:a625:1d37:6d7:739d:9d6d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98b2f115fc9sm7780464241.10.2026.10.04.05.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:19:39 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v3 1/2] media: dt-bindings: rc: Add Ruwido Z3 RC-34 keymap
Date: Sun,  4 Oct 2026 09:19:30 -0300
Message-ID: <20261004121931.6746-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

Add rc-nec-ruwido-z3-rc34 to the list of supported keymaps.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v2:
- None. Only expanded the CC list.

Changes since v1:
- Newly introduced. (Sean)

 Documentation/devicetree/bindings/media/rc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index 43d84296e70d..827f4b0a8263 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -105,6 +105,7 @@ properties:
       - rc-msi-tvanywhere-plus
       - rc-mygica-utv3
       - rc-nebula
+      - rc-nec-ruwido-z3-rc34
       - rc-nec-terratec-cinergy-xs
       - rc-norwood
       - rc-npgtech
-- 
2.43.0

