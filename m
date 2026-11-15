Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794711435;
	b=ChlD0dBPNrn9oBoO7CgQqDwyJM6Xu6sK1KvVxGoZybBdOR2yt6yhYYXPRzs5m+W3AWTE
	 g+dfxYZzEEIy0H1o2QOnwpgrcOBYYqRIYmVJa6oMosyoZPlhwG3M94gc8hdTs8nvVtyez
	 UY+J5dr0G6CbrdUXJcn3TzEJYuC3jIxkcCYFU9nsfk0+WEnvtPm5BvN9oMW9O8EYxiv7Q
	 e/YyKy7C9w6KpG+n5yBq81FoMd/p7TL4/d5B1rXrxa2PaKhQ5EXVJ/XKTqOaZcFGv7KUH
	 iWVwsgcLOCB90+ejQixOERSyXSgZhbdWcAOMHKPzHvjKaxAxqeu3ZNKh4hzFZMrHSuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794711435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k8oz3BQ/HZy3PG6rhWbidZddgjCFH79voNOxMT0Y3dQ=;
	b=oIQZwzlNoqnRZtJq/TsCEXrJsLgg6Z69Odam+PHiZV6R3o6LPjS3Me5IZY1HFJRB7lTb
	 +PcJEpZtZFYzC+gN7DHihWaQyJwX2ugpOiWms9rBF6GGv7JrZ5iYOIU8q7WZOSgBUd8X4
	 w9YmmJq/WxLNO5mCcUKoavliDQpuXcuis73P/mAGeGCI0038r3fF1L0fCHeJxjBHzknfE
	 1GnUxXtWk8QdC+d9tIqoMsKqoM5beVycxFOowJFh8xXb8TU26rQCDEMWzHIlUQ17PhE3X
	 G1Ur6ZpwLaPN4gBR1cGJo+cRXzfSODfcTrhcJZpki3117O/avpa/Swwm+GqMVvLWSsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBMlvkKh;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D61606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21D61606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBMlvkKh
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3791619605cso4666156eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794711434; x=1795316234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8oz3BQ/HZy3PG6rhWbidZddgjCFH79voNOxMT0Y3dQ=;
        b=ZBMlvkKh6cHMxXN1iorhJZvHD9gBK9TBMWMt+LC7sdr2QqPGNXiCfTeRMXsXx5+O0g
         8ejKHCnW1fTPGdI68XmXTQMxhNplXK1zADJaIzkFNnmzIg/RAZWX8Jkom5nt6Hkf5mRO
         wxE8x3FFZBi4mQ3zHgE4yLEjtU+tYmVjCbSTRLesAT2Y2OE7vCVc2vDKP0j6jdsrs1In
         KcL9BVLWGLT8D3dG9tp10fCXqVs0J3r7ut0vEL+ApmBzR8d8FL5XijHJMCOtkLhv/HDK
         k3cyq/JpxidJopJ38WYoZEN9zCRPRoqF2LVTpu+QMajWBfNE5aYdUObD4BXARYLogtzQ
         xXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794711434; x=1795316234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8oz3BQ/HZy3PG6rhWbidZddgjCFH79voNOxMT0Y3dQ=;
        b=2cN7xK/G4xBATPoXaL+X52/gluDDoIJpB9SuCbgKiXd3l/DPZj9D6BOhTIsoGZg6yN
         2fdRcacXpDxRANeBbtYYv4umdtXb7GitQ65s/amPef70QP8QgslLaNd10KN3I8P63wN3
         AUDM8Yi3DdYHzAovHZDaCL3/XqSi7tQX9SySAUijivTHgCycAXPEG3m1iKCZIgQtlrSr
         17vPQkFz1WEt2wN0efdlQG1MlAghxKvdjWAQxkmnmVOrPSLHBlTD7orJaTw1GpTPFCTp
         mwH+mwrCpuvrGxaC1V+C0cFqFw7pYhw5pyl1kaQ9HARyhdgoo4Eodxw1lK8Zus+tpW0Q
         h9fw==
X-Forwarded-Encrypted: i=1; AL+hErFHz6uUUpk26Y+Pve4u4saM83w40vBiAuau+VMkTMZi3GVK83GjDLfNt9zA2VdThwTxvQkYzzKLzeb6Ox8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yF+HNqKiVpj20ZJ8Pisuhga5HB1v9qGeLIDMrnRoQgry5lB+j
	BihqrF3dS2VTFMEYbLqOqmnUhMrlotWS+BJfuoXRd62B7e84dCLkBXq4
X-Gm-Gg: AYBFou2RnvqqMPe70nhIPyrCQqcIOETNJaaQU17tK6R1gHpiLM2oM5k00cw5nM74oN3
	8S0Q4BW0KQeUpE1I0TDB1nHpK2lYihAuINhSJ1gSfzafNhSRpI53UPuXjBM4JXD09IREgV+E3O0
	1vwH8i8fbxoKbcJksKvHhNl3KS/+C07KuaJsmQq/68mLSIENA/uSPRA2APWo9qOtVDUiyQlYBWr
	b6yOg3D8n6ttKhyKmtM/YgoJAW8yqa7B1jOfjx6ZqAqcD6rPFUkURvXGXS46aoWS23V2LCKGCjP
	cDsNnbrySJGm4omCPuZFXu/LEck1U55LFfzqpbCuqfrlX6XB0qPColOj/d58pEb+aF6abirB74h
	DN58PXjHLvOg5mtzt8FkV31TQ4kIVpO/j62lC95RkrZV8DLWMketbRJU3x6QBAuyfrqRRUT8bwb
	MDVaQP4iI88A+tYxZl3lj+1d9bhSaTt3tipfl+NStPb3tDF72v099FWLDiESLfYSOp1j7mqbaey
	LuqHR7uoExmEVf37YBqGicl5nm2STUta+oh53Lqymbs4U7+rw7MtkOw1HZ78M8eiif/vZWCBbTD
	p3nxhajgnV2hl24R9z5UatRLYHAWljiupjig2/DfaOacYjQHTPwrPtuahST7O+es/O3z6in8BwJ
	H7SXWgQvI075b+5a8Z3wWPXPGYdHI+pgDrnwoKZNhsCBaK+zqDnm7/+gozeHpYVF/wV9tQugE8Q
	==
X-Received: by 2002:a05:7300:8248:b0:36c:a084:30a4 with SMTP id 5a478bee46e88-37966960b23mr6871516eec.21.1794711434128;
        Sat, 14 Nov 2026 18:57:14 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm22022472eec.14.2026.11.14.18.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 18:57:13 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: nicolas.dichtel@6wind.com,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: Re: [PATCH net v6] genetlink: Reject joining multicast groups no family owns
Date: Sun, 15 Nov 2026 02:57:06 +0000
Message-Id: <20261115025706.1441789-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2a362c31-2659-4a5d-a7b5-a50f646020b9@6wind.com>
References: <20261112094205.1120090-1-anilkaushikwireless@gmail.com> <2a362c31-2659-4a5d-a7b5-a50f646020b9@6wind.com>
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

On Fri, Nov 13, 2026 at 04:11:05PM +0100, Nicolas Dichtel wrote:
> Could these tests be added in selftests?

Yes, I will add a selftest for it. I will wait a day or two for more
review and then send v7 with the test as a second patch.

Thanks,
Anil
