Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C37B40E8C1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763548; cv=none; b=ASmIv6CwBozuuUtX0qyLpc4h2dXlus/Zb6nE7hlsyAvuve53bw1SUJlAUo9TwfO2IaibnXovW8MfPBSMsVJtWhjSApQ8AzHIRmPMruYXdOW6Z/o2dhI9hGjB9hVFkxOMj55+hTWYKTKvGFaKr5XlDoLM/540zAdZNe6E+dlldk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763548; c=relaxed/simple;
	bh=5fUeK/Z5b3ew/Qab9dwvTg8ptqVTibIEMxGUMA1R2/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ubkIR1wFzZMPnozfsYbopbBDw2vjZRdVyGMMbnkQG0bPV7pL6w+Ds97pNdcTvi27wGoAsqlvDm4Eyi7rt1r1YLM5yTPCoEiGjP7UjbbwFnB6kqYW9V3G78yGp20FabPKs3jTcY3NthTMBzJYOHXjPLpOgO/hKvVXjaqja8AF6mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2OcIATn; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2OcIATn"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2272212a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763547; x=1789368347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRkujaorlRRownXMQ24CydTkW9kZUj9cAg9923H2gP4=;
        b=V2OcIATnVVro2MsY3OySyMiCqcnRDyx+tbptnBpq9B+d+OcNzPtlhieouEqOEAhP2l
         tbPNIg8Rud+fDeLtrOevThoM8fXbuPpQ0ulf2lCcP+gYxaWLDD5vWXpldSE31IPUxvjD
         qzkR1fTGI4X7pRC2pNDqqofAJPkO+j656adGoj9FbqGU4IWEAP8NqRBo3X5G3UpOiaAZ
         PPuaGZmTFDXTYqdkiIOBLoharWjcizIgA05jWUb9hgDaC0hqiEFL8qeGXHfHS2dNhlXF
         s4l0JXWHh/c9/X25DDDdrqdqk1ruIpGM7QzrTItAQhNDCRSA+EVPr7oHK83PYo1My83l
         RxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763547; x=1789368347;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRkujaorlRRownXMQ24CydTkW9kZUj9cAg9923H2gP4=;
        b=VwRoLX9v1R12wM6h/D6+vEoEsGXdyTgI23WrWBZS9XEzSGdWFC7AddJM/wxAEPpAF2
         t3z3fWNTbKAClQtawsfSOEtO5DAHYvcC642mHtvufA5GcLoeM7iJVJYEyPBjyyzdFtKU
         wyunq4QSdKgrC88V9+XKSdDhWdooa+sTA+wAwQv5rZlL2Jy63HEnxgHHRfIyqUAFHFAx
         ab/qY+gs6gMlBn14FkdPs+TeYcQ6RFWayVuyEselZhpzVn8gAnS+uTel5OM50A92w4QB
         a43VhzMvUjZLmyDSvR2Ns49V4NNbTO96eUSmLBhcq38CagJvTNVepn3cG+IkmM5b6xMB
         1Jng==
X-Forwarded-Encrypted: i=1; AKwUvBwAX5sUWgr82jMdRqK12yQYugMY+HEmnBhVKdloSANVlgXKQty0BnqX2p0+gjWV4/nXniDX+Pc1KtfO6/M=@vger.kernel.org
X-Gm-Message-State: AFuF++mqV9Jymkno/YD42voUSYoI/aygxSNz3A/T7ZQxp/0A0kvNYYtT
	AtWievrjECBrk36kG5itoTkUqmYbm5g1e7N2Bz2rsJHFrlEe0Z1awGHB
X-Gm-Gg: AYBFou1OcWxa6rmx5kB/hJyQTXMZubJjazZlEWokdNUJAakBYimP1USUMzR0rFwOATU
	o4MtYPjU5OK842Xs5sl3dxWcezuEntL9XC9sa1SVNxHYBFrIAKLCtOmpBR/RIRcoThQe/KSn4g5
	0YZpM8upH1AAg1ObGj5SO4QmYA1GMgsA2GrokxoGTbqOmS8WFhO+/du2llMq6md1xjKwG+1F4Iu
	KzpbZbSE+1du+Ue9BT1eywCLXyB+kyK+k5lzWXqT8ffhjItfqi6uxbF/wYDWQPI5IHiz4xmlBvB
	f3tlu/hMoB11QDb82FJYmmrBNhUW9Myfb+jxUo4Oj36+VgojS2sZdyaEFomaPyD4n7d7DiPwszm
	4MiXHJtEuSsObyGC7S4umkpMdUz3ghWeF2pQWDssQzf3SKjHwJ3YOjnwVObd/cqY2PaY2AB4lYE
	UEyQZxTqkYbVaqkgLL99fuGmIdYZDvEA+a4nUueHtAQWJG+Y2MTENoLhX2s9n7/hpwPc4QgY7Aj
	vLP2Bv+nLHArQ==
X-Received: by 2002:a17:90b:4d06:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39b2614df74mr30463582a91.1.1788763546458;
        Sun, 06 Sep 2026 23:45:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm17209594c88.8.2026.09.06.23.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:45:46 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] Documentation/networking: fix repeated words in comments
Date: Mon,  7 Sep 2026 12:15:28 +0530
Message-ID: <20260907064528.6602-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064528.6602-1-hemanth.selam@gmail.com>
References: <20260907064528.6602-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 Documentation/networking/device_drivers/ethernet/intel/i40e.rst | 2 +-
 Documentation/networking/device_drivers/ethernet/intel/iavf.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/device_drivers/ethernet/intel/i40e.rst b/Documentation/networking/device_drivers/ethernet/intel/i40e.rst
index 53d9d5829d69..e01f0adda3f6 100644
--- a/Documentation/networking/device_drivers/ethernet/intel/i40e.rst
+++ b/Documentation/networking/device_drivers/ethernet/intel/i40e.rst
@@ -692,7 +692,7 @@ queues: for each tc, <num queues>@<offset> (e.g. queues 16@0 16@16 assigns
 16 queues to tc0 at offset 0 and 16 queues to tc1 at offset 16. Max total
 number of queues for all tcs is 64 or number of cores, whichever is lower.)
 
-hw 1 mode channel: ‘channel’ with ‘hw’ set to 1 is a new new hardware
+hw 1 mode channel: ‘channel’ with ‘hw’ set to 1 is a new hardware
 offload mode in mqprio that makes full use of the mqprio options, the
 TCs, the queue configurations, and the QoS parameters.
 
diff --git a/Documentation/networking/device_drivers/ethernet/intel/iavf.rst b/Documentation/networking/device_drivers/ethernet/intel/iavf.rst
index eb926c3bd4cd..5840569917f5 100644
--- a/Documentation/networking/device_drivers/ethernet/intel/iavf.rst
+++ b/Documentation/networking/device_drivers/ethernet/intel/iavf.rst
@@ -171,7 +171,7 @@ queues: for each tc, <num queues>@<offset> (e.g. queues 16@0 16@16 assigns
 16 queues to tc0 at offset 0 and 16 queues to tc1 at offset 16. Max total
 number of queues for all tcs is 64 or number of cores, whichever is lower.)
 
-hw 1 mode channel: ‘channel’ with ‘hw’ set to 1 is a new new hardware
+hw 1 mode channel: ‘channel’ with ‘hw’ set to 1 is a new hardware
 offload mode in mqprio that makes full use of the mqprio options, the
 TCs, the queue configurations, and the QoS parameters.
 
-- 
2.48.1

