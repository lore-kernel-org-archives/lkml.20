Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.210.91.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919842;
	b=m10EN6vr+Ui/DXYQvkmFs0QfxzaMsh6WEHg5n2EI6lLayXI3qg4M4JV0ilohiAJJj8mB
	 qzP3b0z5LtubSroIvlpcUMF8ABmSu0AvibdRnbAaY0H0HdGAFFfMs/d/Y7peiVTCEWm5l
	 O3EtM7E/5iNZjipwwEgAWCLX5C390XrsEJ03nSYf8xJ+E3PAxh5nAmjWxNgMHsYaOeHp2
	 NjNb9LcGtI6LcTeA+LgohBpZtqnHYQUF13uO+ueax9etm4PDiLxhN44McWC4d+ng4/FBZ
	 uHzXHmAv4Yu/Wu7MjS6WiyvC3RqoEVQSvHWOEXNmngwLy2xk4qLGKLf7CEIirXYnpDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919842;
	h=DMARC-Filter:Received:Received:Received:Received:X-OVh-ClientIp:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:x-ovh-tracer-id:
	 X-VR-SPAMSTATE:X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=7E3qIaNmaVz1QhOoJuZVv7W5GWmjavhGo5fWuOPFwyw=;
	b=B73RH/54XNp5F/Tvw15EvAvL2MutZTswx75bRyt3kOWg5UeG/OYRIWTWtbMBoM/1zrHA
	 5o7HMjWB4b6VSrBzcY3k5q7dmm7MqVj67om2pByXAgvdfLgNLtmlOSXeTLpVQhVc4seG1
	 917wCNMSG6kJeGNQou0mOGHqDcII6Ci7yDQ7l5O+bulMYiEF5BLfsDovVhOxN+DB5oDJV
	 gF+vYzr+ILOpIzI0YxNIkqZmbGh5Q8NisnyjXvEVXzOYba7PhdVLWGiiA6o41pmo4klnV
	 j1cA++pljbs7lL97QFpH8i7PQU2EABKdRMzokYtmWUb273eJe1AtPw2W0OgbqH/EIog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pixelcluster.dev;
	spf=pass smtp.mailfrom=pixelcluster.dev;
	dkim=pass header.d=pixelcluster.dev header.i=@pixelcluster.dev header.a=rsa-sha256 header.s=ovhmo-selector-1 header.b=SaP5RLG1;
	arc=none smtp.remote-ip=51.210.91.37
Received: from smtpout8.mo538.mail-out.ovh.net (smtpout8.mo538.mail-out.ovh.net [51.210.91.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9895E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9895E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pixelcluster.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pixelcluster.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pixelcluster.dev header.i=@pixelcluster.dev header.a=rsa-sha256 header.s=ovhmo-selector-1 header.b=SaP5RLG1
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net [79.137.60.36])
	by mo538.mail-out.ovh.net (Postfix) with ESMTPS id 4jTPj51Yp0z6FGY;
	Tue, 17 Nov 2026 12:50:33 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net. [127.0.0.1])
        by director2.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <Felix.Kuehling@amd.com>; Tue, 17 Nov 2026 12:50:32 +0000 (UTC)
Received: from mta6.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.178.78])
	by director2.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4jTPj465Wzz1xp2;
	Tue, 17 Nov 2026 12:50:32 +0000 (UTC)
Received: from pixelcluster.dev (unknown [10.1.6.7])
	(Authenticated sender: nat@pixelcluster.dev)
	by mta6.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 61FB48E2104;
	Tue, 17 Nov 2026 12:50:31 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-98R002a7f9e4f6-90e2-4150-b932-19985059a3b2,
                    00F4D7524EDFA56606BD67631AE7EA1B984E627F) smtp.auth=nat@pixelcluster.dev
X-OVh-ClientIp:141.95.41.139
From: Natalie Vock <nat@pixelcluster.dev>
Date: Tue, 17 Nov 2026 13:50:07 +0100
Subject: [PATCH v2 01/10] drm/amdgpu: Remove unused parameter from
 amdgpu_vm_pte_fragment
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
Message-Id: <20261117-prt-explicit-sync-v2-1-bb3851cb6a0c@pixelcluster.dev>
References: <20261117-prt-explicit-sync-v2-0-bb3851cb6a0c@pixelcluster.dev>
In-Reply-To: <20261117-prt-explicit-sync-v2-0-bb3851cb6a0c@pixelcluster.dev>
To: Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 =?utf-8?q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Natalie Vock <nat@pixelcluster.dev>
X-Mailer: b4 0.15.2
x-ovh-tracer-id: 5591218938405806396
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGrAxNh0OCp/TgW8Z00538M1glw8EUMMtYMTQIkfoBlnYfE0vlSyw4w5uWuf/QyKUtvCHx7EFC1YQK9QJiefAOuQT22/RonVhgC56ibCMLxgK4dCCF83EYDfkamVxfHM+wyA0Nvvm7rS+sCNtJyY/Jb00er6pXntUGUJf0EYzZZCpUQzQXqPm/8qDoT803NDa4r5nrmdrrXIxHrrU/3K45uUM+B0+i0D8Teg3+rNFu/qNg8OzEHLmYLG3Bn2ErMgHoNASckJmPFcSnlHiSRHxWGk75pm1zRPdg06qGv5yp8rB45X+XQ8Dp2qVMqyf58e8qcwvzrNASxckuxfH4TwrY7agcpFqZtws4puYGXkKOCzHoj1xrXfRKMTavd6t0jQsywhTnP0TOmkDkX4jereRFgewxtbMoq5hDjd/XDPuEPILj3zbIOVe+nQJlXo88YnG03rmErpy2PsV2BbhKZnUaql/U/tPFYP+bRdf4Qm2QJJub8sXmDBoSnqz8iDio6uJwRSjix/tUHRRCNrrEFtmfchPitk0CuE5hTGAAjyVXshyjBui533KKu1+fjWj1UOlDK6GNfPlBfGXOerpTgcpqg4JE6WywdXd+ujgQfKWhJVFxxavZur39YKM49UGJok8u+4JK7mKNMtnr9IwsRK7rwXvjukPMf3OvgQF1LRsNHQg
DKIM-Signature: a=rsa-sha256; bh=7E3qIaNmaVz1QhOoJuZVv7W5GWmjavhGo5fWuOPFwyw=;
 c=relaxed/relaxed; d=pixelcluster.dev; h=From; s=ovhmo-selector-1;
 t=1794919833; v=1;
 b=SaP5RLG1d/shDBVl4VVJt53my6q9bszysG7SsZ6dXGtqP8xZ4Y+GNfZmSshVcvmHotA7whEU
 SYndHkFMh+U3JOlssvNIHuivD4B/wCKf0pIjN9S/MTg3+k3kEYlclXe+tYH/NGo0ys+9y21ZW0H
 AcdjV4iPECqWp2ySvY9yoZO4pp4KckxbN5AocnAOUG96v8pRXClfxOB7wMpUESdeEfF5gysayEF
 w445Drke/24IVYmUHDD/sdhSfcwdrzzwATXQM6crI3L3q34JkcPO4BKO3LHVSi8nS7UVjo3J7bc
 MGD4t1NUuycE7gxvknctCuI2GKgY02PWSV5Hq5lrwX6ag==

Trivial cleanup. No functional change.

Signed-off-by: Natalie Vock <nat@pixelcluster.dev>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
index c73eb416c0e26..4eae6a831b4ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -745,14 +745,13 @@ static void amdgpu_vm_pte_update_flags(struct amdgpu_vm_update_params *params,
  * @params: see amdgpu_vm_update_params definition
  * @start: first PTE to handle
  * @end: last PTE to handle
- * @flags: hw mapping flags
  * @frag: resulting fragment size
  * @frag_end: end of this fragment
  *
  * Returns the first possible fragment for the start and end address.
  */
 static void amdgpu_vm_pte_fragment(struct amdgpu_vm_update_params *params,
-				   uint64_t start, uint64_t end, uint64_t flags,
+				   uint64_t start, uint64_t end,
 				   unsigned int *frag, uint64_t *frag_end)
 {
 	/**
@@ -825,8 +824,7 @@ int amdgpu_vm_ptes_update(struct amdgpu_vm_update_params *params,
 	int r;
 
 	/* figure out the initial fragment */
-	amdgpu_vm_pte_fragment(params, frag_start, end, flags, &frag,
-			       &frag_end);
+	amdgpu_vm_pte_fragment(params, frag_start, end, &frag, &frag_end);
 
 	/* walk over the address space and update the PTs */
 	amdgpu_vm_pt_start(adev, params->vm, start, &cursor);
@@ -932,7 +930,7 @@ int amdgpu_vm_ptes_update(struct amdgpu_vm_update_params *params,
 			if (frag_start >= frag_end) {
 				/* figure out the next fragment */
 				amdgpu_vm_pte_fragment(params, frag_start, end,
-						       flags, &frag, &frag_end);
+						       &frag, &frag_end);
 				if (frag < shift)
 					break;
 			}

-- 
2.56.1

