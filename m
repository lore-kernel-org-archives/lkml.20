Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793289059;
	b=dwhBqUoI4ok2nXicwco2XO0SJHv0+BGpNytKhgWH8HhZjPIqyh2iLyX86vU6mHvlT8r9
	 G9kM6nPoDCQ8Tt2rW/e4iL/VsG66hOH4UrBtygPaw9Md84myC8o4Ve5HwOhKVnKEBgfuV
	 tjOzyLIgepHi3AZKxw3hduaePRFaDj+Wj0Iqs1/nO8E7njxZVTYheSEp9TYqoSZmdgq83
	 UreW04VcPN9ls3EBkuXOYZXsyksFhUpA3zLTnBv4WOKZ72z2n5T+xNYSwSP5PXPr8l2xa
	 t90GZzXJNz4uCt4rBqWEjdN2O0gU75GX3GpQ4gnIfwFSVnTZ4aoV6bk4qQ/aN9Fbzlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Luo+iCGFAFHcSDc+DCddHy/s1aw6YXJoZRSJFD58nlw=;
	b=3GHA9EuOKTKkIqzAa4b1XH7aut+P3tJNqvTLwDoYvhOILLPQjlAuLf4M94KEQsG0MPIt
	 u7WhjM3j8pmqfuoqCT6poNYsqYcSzGtYMUegN7f+5WPzSUSg3UeePnqbM+QZY1Qrz+Ryn
	 XI/PBtVrss16LQ/oOZ8SLuDdnpEPKaMU8gamkI9gCtfMtR9XQS1fDvGVGWvwLyEtqEiVk
	 WQnC8FGCvzb3NRfi98MD9PrLq34p1jRGxvlcPd6wUDSRe6uJtPPAeJ+yEKi/+PvLMLQnW
	 tTPpHxtNEWhyDRols9iDN166BdGpgAzMXdtXpdoK3VAdPDVPXV5gDEyhFAQprYj3Udw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CCA606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9CCA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e64d52949so181441785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793289058; cv=none;
        d=google.com; s=arc-20260327;
        b=JyeVpdTsojS2q0zPdnilbcBRcFymtDjCavUwppiPTSxczeo1AaUDlkwl1MShtnhsVJ
         6S1qgGvFJzOXhC/kCZjhO96WW0uVzMPjkxwSX9mhiGNxnLU/9I3xjH0Ti/75AZnpQhPr
         6aoGUmsIf/jUX0tas06OhrKj2xPxjiQwWJsBAP7V5nON5AcDIyXSe+59cspcxBGqf+ij
         AbnbQFtDrIZIRBPNP3/ybSYyZfJhCHdT/mRajLgNWqDOLksK3p5wkfuwb5JpYNXY1Yxz
         xOWEwavsEwNP6KZpgotwuBu69Fu5qkUbv/ywtrYwsVfAOX0m6+ESti8iFKLWD+h/otlj
         RX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Luo+iCGFAFHcSDc+DCddHy/s1aw6YXJoZRSJFD58nlw=;
        fh=ZWAPf180xjCYKV9df4mjq4l+4M2EUK6Ne58rau/jXmk=;
        b=e6k+JolrPAdhHn51LgkcDDRtBS4/NnbY6acR6vxlNsdkihziMzAXPjQIjVKanTTjiM
         VYcsm8pyjbp95CnVm3+YnM4cCDq9/JLJXb8FUMcpBNK7FzUJT6l3Veav40jHaErOyy3O
         VNyhPrDNlhUkx118TaGOZj0s3OYAptEM9xEoMTLgjysllaiPn4/6b4qaL3qdehNHfcJF
         41VMtgBVStx42b2EyLKrYo3j7Zr7a2V9HBf408ZQD1Eq1MrQDUQQndEu1BtQeUjU7mOl
         i73z4am3xbHpJoUZjCKP4hQMFGA6yExzrqbkXX9/OVIHkz9fxy11wWR2qZvz+sb1xFQY
         JALQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793289058; x=1793893858; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Luo+iCGFAFHcSDc+DCddHy/s1aw6YXJoZRSJFD58nlw=;
        b=TfDH6aCpztOXqSOcX7gkZ0PLAMLvVJhyhmUsoCKRVYfD/rFDPjf4SrGT++Wqe4HKu0
         DiYy68ddP3qYK+8WwoG5X3qmOX6WQr3N1GbfqtX07Spl7qlxILigS9esyLkRIqNGKE3+
         ChCbDxfH1IMeuDQOcLNqmFUpBROTqgXbUareD3Zge0Tk7E7ZAeSmN1NA5toxLtqlLVve
         1bm7uiTdGHcK2MdQH2yjkVoGBXkZ5CHXDos3lJlkEMDbGio1DBycamh4QnQqIbUMGrR9
         0TsI+eEhgX+WVje9Z784hT1Y5qKWtv7GO3XBqXdy7jFmbbKVqko97NqehajzVdWnVfBP
         wS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289058; x=1793893858;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Luo+iCGFAFHcSDc+DCddHy/s1aw6YXJoZRSJFD58nlw=;
        b=Bbzuw4xPkM4jPPlAnGoppjWC8haL1v/47zO9JbTCOPwMEUyKYrY6aCHoXj4IisU2c/
         KAxqX9GGQXDkGNdOJ+btRsGV3erxncj6BlrTu54tZUhYgB0YjGMhExRwMBatMF8HLOHn
         oNmcv20rsiBVsE/YG2Xv/vSY/ab+4mFSGzbrBLlVN/urnpa4awUDO6BBmaWOZpmdieTq
         HxzsOUy1m/uVBYzwWsvyeBlzpukteq1HOtX39FhNPwal9VwJKQLXjDLrm8tfZNsDZUxF
         UCNYu9xecocu/qcwwTXi6xQNSXa5gr5lXkZGMOpHYE7h/anz3YDcFzg+IHhcnyLHQxo7
         gdNQ==
X-Gm-Message-State: AFq9FYKl41U8s5WCw7aMmxgSXK8d57Esr1oJjrJ8VT8XXxjkIz7XR0bJ
	LyLBo+C8ThYkhVt/WsNlLKlDxBdCjdvpg+Bp5ZMJRyJ5Y8jJfrclO8uicsrExjVYVM7K7GrHPBb
	j2vDumAqBwWArcdea81wt7UHbGyuOePXrfySivtv4AHfr+4YgkDbJFVkwug==
X-Gm-Gg: AYBFou00e9bMsJOn39W+M3/cRibGE9EGB1xr0Zw00m3A+vVvTOEhdvkNhklF+xGHvuP
	7Qw9aIBTtg+fq2DBwSO/JFTxjE3Ntr/k7JnZL393p3Vq+63iCVbDv6FIEAcbxoX3+E0La00wk6F
	YUS0B7WZC0v/8lpP0Xq7aqqKnZ/2qBP9wtJWQsT/H0Qv2Er+oRN+jfryBQHjbG5yPhPOJrRh+lb
	qVlmusMfephiIdmNPh4uvdLxKksTcIUITYYApr/FAfXRzI+pszZ3J5qjwxL6+zSennERMd5XxAO
	zHTXpCmuJkIBDCYfMhvPr4ly01xAecToygHZk9hZEEwLfEL+P2WvFUcE361j2RN5iblaYJ79YV/
	mkEMebqRaN9Ofkh7PvF9RRp6nCNjdFIGMKj5+AbwvLw53tl/BzcnXMvKkYUOwHNgPGrehEybHPv
	+Lb++Zyihh1X6i19HPL8/GbSExws+Q4gD1pJU04hn6uFCKH2iGOXcaKw==
X-Received: by 2002:a05:620a:2a03:b0:93f:25c7:a4e1 with SMTP id
 af79cd13be357-94408a5f806mr933381285a.26.1793289057715; Thu, 29 Oct 2026
 08:50:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 15:50:41 +0000
X-Gm-Features: AclHuK9N1Sg8EJuZZRy5QhUVld5bqPX0n2NK_IIkQxa9iUUvYvDqObAJQGNKPeg
Message-ID: <CAPY8ntCh-6-54Tp4c2srp_kAhaCs-gHixEq_=qMPf+rNSWsTtQ@mail.gmail.com>
Subject: Checkpatch false positive
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andy and Joe.

Checkpatch is giving the error

ERROR: missing sentinel in ID array
#1455: FILE: drivers/media/i2c/sony-starvis2.c:1450:
+static const struct of_device_id starvis2_of_match[] = {
 { .compatible = "XXXXXXXXXXXXXXXX", .data = &imx678_aamr_info },
 { .compatible = "XXXXXXXXXXXXXXXX", .data = &imx678_aaqr_info },

on patch https://lore.kernel.org/linux-media/20261022-media-starvis2-v6-1-374343f55fd3@raspberrypi.com/

The sentinel is there, but just not in that hunk that renames the
struct of_device_id. That counts as a false positive to me, hence I'm
reporting it to you as requested.

Thanks
  Dave
