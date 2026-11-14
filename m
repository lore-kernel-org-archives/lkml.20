Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686210;
	b=u4UxYoegGmYZFUkSqXqvS7jF4sbAqImVyuDZmHPpPznd7cAAE73G6I5P82jWrdepTlBq
	 RjW9+idZBZXAqfh7eDmMUKltLzhsUx6V5FTaIyli494GO5Dq99DAnK61EFXSV7Iq5fjZf
	 0JzrN9o2yQujqj8YzaQWFhGuZQk+VRiyTkVS2AKz4PrUQAi7kWLFyR8Lw5HOr2ekwPPLS
	 MKOC0iB0ccBpMbpwvx1nppsMTSxbz4900KBlirAH8hDeQMdKEDd+xX40dL5tvXjYBbJo2
	 tGAzq7o03tFM+BQSUe01lbphNdktq95/3VehGnndmCyFySDGODDTYKjtU0RwqACphNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
	b=kkw9Q/tVy2c2NbYUV21fsPJQ6gu9cktUi1DT/TF17PetURdGOcyGHbcBeLZxkznZOcCg
	 Fyq5nQ3yB2argC4hSQse0eUsoXW5lRq+7pUSbkz6nqOIcBA1PV9OEMCz918P6Cg+CgKKo
	 uR1EewqJ7qGZ1BrPFEVN94dhHHcl6Cw5ACjM5ZKz0En5gZ4UdXCRKAD1vm4Kx7E7SCx+g
	 N5rce/Up50Rbjx1vucGgsF9cipJHnzuBrL7ekHZkh74JJk7geNBHX5qUSTj2B/U0AlrlF
	 4FTXY3p6WwzlzWvhthxGvuJKD6oqjJPYTq0AZPDT3HrAXFs8lvnYi2Zc3kqqsDRu20w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=g9y4Kqb3;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B9760A260A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B9760A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=g9y4Kqb3
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb9d5c1c8eso1698038a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686210; x=1795291010; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=g9y4Kqb3xQZI5SfaQLRCJwnELO9McjXi+OC+lVOPwHgkeuPIjg+1PfX+vH0l6xQNu7
         dRhgS0vAAYbAAZpE+kYQ5ut93ePMChHPG6ZsFT+1wdwe1h9GWjXo7R+0ztE7D3hatwi4
         1rEtUZ+u6XMtcwrwmcsaO5RNfFK500Dj4GVhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686210; x=1795291010;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=KPAh3nw5h3JKhWZP1eP/eYd45mw0BoaA/wUTLRXVRuENK9MO/kbJq4Ew8y708nwS1z
         6sRSQP6ZQkbNKD2QyFaly8/4YbvHtCAB+qnjW2RFPyomoKYe16nm94oKFXShBVp29mXH
         3sHBtj+jyRtHJk03kmTNqR+Dwf/VrNnNVzsWtQYjOvVJl+OWJduzsYAiinYP/AcFOz0c
         /hbm5VEMsEqJbTFAmmwNSmcGLueulv5tCzUF4pbDndzHVa3i/hbR0vYaKCbX3nUCppKQ
         JWcaKSboA2UkJNyDcL43/K1y78cxpLPcAFgSdGQFfI2WWQ7pk7B694h+xiile0AP58+F
         jU7w==
X-Forwarded-Encrypted: i=1; AL+hErFA0iW+Z1ZSiQMUFpdmJfFFL03J7GCokj8e8+RvJuG6cZSA7EEdFr8j4/0pj5Y0XOib05jCzQOhOlHVSeM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p0f7Bcn1xkGcqoGQ68Zw1IyFSuSdrTGVrgW/zMuQueEghNtGL
	yFVc36AGSBFW4dJbfbF0OxpsY3PBXiCY1f+qjA1/Hd6s7G/e3teeMuO+OUSm6d2yNPs=
X-Gm-Gg: AYBFou259+KbPvYz/AFLNHuXuCSCiwTzHjX2drG/hFBUOBSHrQgWaCUWmiJB3ztWT5M
	QcWWr24tq+rrOHirzY0d4E+b57hDMZ0GHmIS4+I0FOOJQzvaL5ENmGgdYeKJBx46tKuSPHPO9xa
	JYYbu32LpvsWRFFZt9pHAoWJ3bUrMxPDLGD+4muT77WKieOwYRkIyYDSvrMPTZYe0z0n0I9xM8+
	TSP/eTLgrb2Yu7386d2TxeshvkxYSUulTN9KHQIe7Yoi1aIcbNM/EU5lgN3pYWNybQ4uPGTrMH5
	fjtCRn3zMIS/4AiA2LirU80Gi+X8LMut80wx2r+drKl0BreFJ8kFOL8DV9J0cQQH5WMHOebHbJQ
	qN2n4DXsKkls5sehDtkzVvYBQyGcgPGsYAPs43THO40kC2T7oExG/j3HPwKvNYq76l+RybTlmxX
	Q9lOjb49AiRilKH+LxvQhUWCUX3a8HsBSL2plxJlOXaEQDwLoW1I6KMJOga2Gn32OleWTPnRMiS
	MMLur6oJfUt6RTR3XEst2J1QOD3XaaowWN0GpRqPEgPXyIapT0OIQHpm4jRDsz8lgNiq83DM+z+
	4DgnpB45JIEWno/SN3jxv27C4voNkehRXbs9rLus35D01JqJ8vbbZxN11jiOdJXn6FOJW9UsP2W
	/o5wWxXCWGBDlcWDID4TRwRtjxIW5vfx7yB0SaLRgPA9KlCOJKP0NolOb4Rdon/TjdeKY7BvJoP
	D8WQn96k6lpvCpeX92hhoBNKbrDJrhHJ1Ir0va4UDsZD9lyk1y+OjAQcId
X-Received: by 2002:a17:90b:48c9:b0:3b1:21d9:4c3d with SMTP id 98e67ed59e1d1-3b1b0cc8744mr6495500a91.39.1794686209991;
        Sat, 14 Nov 2026 11:56:49 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b110c0sm4748452a91.3.2026.11.14.11.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:56:49 -0800 (PST)
Date: Sat, 14 Nov 2026 11:56:45 -0800
From: Chris Down <chris@chrisdown.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>,
	Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>,
	=?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>,
	Chris Mason <mason@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>,
	"Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 05/13] mm/migrate_device: don't collect a range twice
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-5-50a2ed382b61@kernel.org>
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
	<20261113-mason-migrate-et-al-fixes-v2-5-50a2ed382b61@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114115645.be49d8916bb1b419@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Reviewed-by: Chris Down <chris@chrisdown.name>
