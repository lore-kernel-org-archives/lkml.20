Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8C74E66B8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861091; cv=none; b=L1rHUvMKM5Aa0SNdx5zX7DH3AJW3biGRvlVUunq2dM4UWk3hHXS/OR3ckDHcYTRXDJyE98UvlSrnkM2mOQ/9BBCAncjHsqPKWrVwdl+6XfNwMklHo+t45YWNd+hY97j2I8HNStCuZooDqjLziRX6g5Aj3p9ME0X/1ADr5G1QxuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861091; c=relaxed/simple;
	bh=5CWTOwOGmV0tbIBmvdnUvKYui1xJoatPFsL+LsX19RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SdnQ5ikyUtrvqAUmfakKCJS/st//nBvDMSlDLx6tbZU6NpWNNuH8TmKx92vUCnPu0aExVxbsKlZmdYQubAsR4+02gbNLH57LxOIp15kxvgK3qR2YwENpaOSdgoO7+RL+cowSbGdRI6iGZq5E7LnsfPfWEzRh40FW0krOMkKeuJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQRKJ3xX; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQRKJ3xX"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b1a806664so561603a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788861089; x=1789465889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CWTOwOGmV0tbIBmvdnUvKYui1xJoatPFsL+LsX19RE=;
        b=CQRKJ3xXgW74OfBTd/g6J7KyL4zGi32EJIk2VBzvm3Uxh97turAx1KhRC1nNklLW7M
         UVho9kJ/5EnV2TEdq9i+J/pF2mDIYgvIHGux1aXTM2tzTZDFEeMNE7CdF7+ROA0aYIza
         ZDHg9ozE2Hay70DEoE2nyjTHPeaUVRcLO2qtPZ3p2n0qhuSo4JfeHwJ8qzmAZumtYGep
         NUEqnWF5GZ+Neeos/yH9fRHj0kSztsFJEYN+iv/EF5RvFZbyDJj/50MoPrMg3Yz06BUP
         p332zIRrqNbcifLslKO+0aacvpKUJn7aFG3RgOaMkRJV6GJ8WiQ56Uk7fB08E26Vg92C
         yuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861089; x=1789465889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5CWTOwOGmV0tbIBmvdnUvKYui1xJoatPFsL+LsX19RE=;
        b=rMG7GLiCOvApopGsuE8qECCibkFSCONK2yukDd2SYJ+366QjUw+qvLnY6KrR6UXHo2
         Z/9T1o+xfKUR0W2NHxUKT+myOwBS9vic+cQnQz74lbqSaZCtXV1+YyPuStvRrCY/Waym
         /tOYvj5kCQ0rMA65Ot+avdG7DnO5W8wBRtuyCbeBkUhWbHqtXgmx4Tz1HRf5+Kv9HmXT
         JNRmnvZ/pUY0Xwh6A+SdLoJaYoKmhE5qzLGJmX+IKRQ6jiy+PUynJwN4MTMJMGQL6Qht
         5PACC49X+m7ndFhPe1rITWW7bKs8zE2z1/ufJuEzt5Rtp/NBiKiJijwYqq6SAq8WPIi+
         MQBA==
X-Forwarded-Encrypted: i=1; AKwUvByYi26naCniB6XmKyg+Xb61b9s9TYNe8DgbiMKEmEdTiW6TBgYNOD6e7c0UqsXEg3qN8du+40tt8rbcH+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kPNX4w/jLsMd95QVOHdPPAG+5R44j1k6mfKMSMk0HtTj6hMUoS
	Op1qv29BvZqNydBbZUcc5cKsXnNobv4I89dGZ4K4Nz5C5svLFnYBql6v
X-Gm-Gg: AYBFou2m3tH9+zICEM83wVMwKxfoZ6nztBObZjTRT42cONFD+9bvzSU0fkMOwIBsIxy
	DbE2WrTEXEwuEdwFkKxvPTDco+WFlUqKMnHhZ+WzVFqqtmESNgca3jdOiiFRI2Jup2mrQwKjRwT
	N+9NtDZR23+1NqIj6eS4uD5niJrZTIGLNbCfw8DttFrY4jkZ4EJx1SHnfV9ASZbtpNPDd+KQgNP
	GOVH5DizB+k6PS7JWLrR7zY5nScf5kivGS+EyWR/zNuSx7JOFeVpDdXClO8jQWVwz4Li+Z9uMtA
	5T1TMKLtTJNKqGQOicYfowD0eaqr5vp4ql4UfjRfSGLA9yMhozbRrL4gnUll0YziZCsc6oPKjtk
	GtTAPGbEYzp1/CU0MzbS5GdObYNDCLssSRBXrkUJt2bGxrrd9sdOCTHR4bs+LQgUs+jcTVarM82
	hoZp1XXzLexw3422vzNRc4O8JvRj4ggDAh/h35ZqiOT0CcATpZ/FYBxH7gzhS7DF+vNpMcI4dOv
	5T9Pe+FlVyRoTjFEZw8FYdSK32pSQ==
X-Received: by 2002:a17:90b:3ccf:b0:39b:34ef:3b24 with SMTP id 98e67ed59e1d1-39b3d5aaa70mr19661739a91.1.1788861089072;
        Tue, 08 Sep 2026 02:51:29 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm39414604eec.1.2026.09.08.02.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:51:28 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] platform/x86: hp-wmi: Add charge behaviour support
Date: Tue,  8 Sep 2026 15:21:22 +0530
Message-ID: <20260908095122.442670-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <edbe584a-c241-c3e6-9993-2783934885d9@linux.intel.com>
References: <20260531181326.1000801-1-navonjohnlukose@gmail.com> <edbe584a-c241-c3e6-9993-2783934885d9@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the slow reply.

It was RFC because I wasn't sure the WMI interface was right for other HP
models. But I've since changed laptops and no longer have the HP, so I
can't test a v3 or anything on top of it.

Dropping it. Best of luck to anyone with the hardware who wants to pick
it up.

Navon
