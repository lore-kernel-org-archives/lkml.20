Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FE857F73D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172920; cv=none; b=InOrQHQWAeWMnW974vE1SB67p5/FPVDGFar0iuCjJGVm0baNjWdkgMqV68WLgl5QcbiXuJKhWcaQ3iMTtQ6mrSYd88PcUYOyq4XnFC5bCMAN3g1TjSIP/qnn2tuZozJFH2k0+QOjxKNsuDIRdDx/PxYhBqQmshyEH976NvinwIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172920; c=relaxed/simple;
	bh=XAyI1pRcJew3RGQsDwTvmspDmty2a2V9xIeyUNk5zCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ew2XGy9Er235mCDQRFYu9NvMHpVP4AmrWf+L/Wd3bNDYURoDkwhWsLebo9mDUlIUjf3mZ9PE/DQeyxwyaAHYADAyuXS+RGD61HMbyX7lc1Ovpw/N6vvIQI+sc0QVUKLyHqC5IEdKqo6FQGur3wJXCUmvB9bH1svlwsIkR2EZ5zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsU096cg; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsU096cg"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53c156ba662so169410b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792172917; x=1792777717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IH2nmRYbLcJJZrtxPMHJPqLJx8S+GWgBxUdUePLJH8=;
        b=ZsU096cg72USkAKHG4sCNZURKvNc+iLJX3mSa6Q73wzA3gOuR49VJYdltvVqq8G/dn
         f62y53lbxYkIn6KfX0/4emGW0D0Gf6SehMCNa/xfGlIzWTyZV2vrkmf89HJG/1nbyqPL
         KC+5zBKxoKOPqxtLIZbuSmwUXAPrMF4PuR6+uOuUEOkl7ozyKQYH5o+R3sqNOH6Ydyp4
         pia8aRLs6Req/upHP3zfFwQRSdaoiUgxeTbnzTHswr11ZNtSN0GpjmhqXaLPAtYCpLEX
         INdNhqNWJcPc8gCmfWKmexMtDjD7WD+yu6V9nU+5kk0eVEGldHF8z8SC67jj5NqjtiKY
         UfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792172917; x=1792777717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1IH2nmRYbLcJJZrtxPMHJPqLJx8S+GWgBxUdUePLJH8=;
        b=dplQlP3jxlBdog+P6/qXly0eNq6CQkGy9h0Vc+nI0CN3SdAc5AR2FzkwBULnF5gKu+
         7Jdy2tm+lwbE2TVj+QKIzZBbEZFqNGfYcp2ZbOfzKa9xUS/KuZ/zRKTRA+qgD1FdF6Jp
         ClbjyUFG3dfR/aQyojLtet8fMPijvzM20j55bZRugv1jV5wqOmpEA/38GkD6iy+BXMy1
         I00blVcdL0+SII3p/JovXNgSS58Th7oEMJgZSKNs8WDOCY0sWffF84kjDl7exW4UJ2Ag
         S/ScbRe4UIzDgiTVR8z74fGUlCsxd3oynlZsAY9JzUXaYcGaLWiy/mWpV8HMkuB/7ezb
         tT3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwaESM4TB2UGKSV3ycmVm6Q69MJMsnpmbogsM4N5mMMvpSx7K+mlZdThh7US9ZWBOZM6LXQ2O7ItbGvgWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSnNYVyfH0m6BwrHAMX/PoTPowJmo6uVTnQwLvyUFEOLieJWty
	dhjDQBgFdoPXIeZlSbaPrSWOJjKVl+O4Hf2+BtyDP06BbKEFT2XdoFgm
X-Gm-Gg: AYBFou0eqOUVpyBpTUTs9NmuJ/zlMcLFEep+YZsEoHvocoHorW4Oj2jAO0S3JhgYZcN
	T0XbD8jAYiLMK8UXrCWFbvUws7oHn2jLyHEf79/PJK8Bo1o/z+gnvCR2GIaruZxidNW56sWFGqb
	jc/Vqgf8JsdnewuCIOmGcqoF4l05hxT37yToFRrO8sJUN2SN2ywSovKoPm0tqZ9J4IgnPwV7kBk
	7OWfxK9bLxXUhwb41GayLaup5F94isOkBxE2v1js4ZLV4GMbv09ipdVE6UeG3XBRnyjRQ5hfEea
	kaefRZH9amOBjNImu4VigVsevJZtfrlnxWNQj7cgzmvKEMldS+uYv5hsyOPLe3+Db/eyPr8jffx
	fiBO/vrwlN6axEFFPhZ1yhDObtrvk00BOHgdfWBxf3R0rYpUD+18yBPoK/Rr9TweQSon6uIrauS
	udr5yQiRUUCCOrJe81UJpnjMfPtfGbVf2IMbODhduoLDIQpyp6ARA18Brb8qDBqBYqBaeW9wqE1
	zlWurBMs3HOvNeMCHaCGA7P7tM3
X-Received: by 2002:a05:6808:c172:b0:53b:11c7:2da0 with SMTP id 5614622812f47-53cd1cbc1a0mr285406b6e.21.1792172917484;
        Fri, 16 Oct 2026 10:48:37 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388c1654e9sm1901878b6e.8.2026.10.16.10.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:48:36 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: skip hugetlb cgroup v2 tests without the needed controllers
Date: Fri, 16 Oct 2026 10:48:34 -0700
Message-ID: <20261016174834.804715-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016-bug-selftests-mm-hugetlb-cgroup2-skip-v1-1-7c78883a67b4@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 16 Oct 2026 20:54:48 +0800 Qiliang Yuan <odys.yuan@gmail.com> wrote:

> With -cgroup-v2, charge_reserved_hugetlb.sh and
> hugetlb_reparenting_test.sh mount a cgroup2 hierarchy on a temporary
> directory when none is mounted and enable the hugetlb controller
> (hugetlb_reparenting_test.sh also enables memory) in its
> cgroup.subtree_control.
> 
> On a system that still binds these controllers to cgroup v1, they are
> not available in the new hierarchy. Writing to cgroup.subtree_control
> fails with ENOENT, "set -e" aborts the script, the test is reported as
> failed, and the temporary cgroup2 mount is left behind.
> 
> Check cgroup.controllers first, and skip the test when a controller is
> missing, after unmounting the hierarchy and removing the directory the
> script created.
> 
> With hugetlb and memory bound to cgroup v1, per script:
> 
>                                 before      after
>   result                        fail        skip
>   cgroup2 mounts left behind       1           0
> 
> Fixes: 29750f71a9b4 ("hugetlb_cgroup: add hugetlb_cgroup reservation tests")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Hi Qiliang,

Thanks for the fixes. I think the problem you're describing is real and
the fix does address it. Sashiko raised a concern about failing tests
after this and leading to leaks [1].

At first I thought what Sashiko said made sense, but taking a step back
this SKIP path can be taken when we're mounted with v1, and the new
skip would prevent us from failing anyways so... I think it might
actually be OK, we probably can't reach the failure case once we skip.

( of course unless, I'm missing something ; -) )

LGTM!

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

[1] https://fb.workplace.com/photo/?fbid=2894459417496799&set=g.190352285091763

> ---
>  tools/testing/selftests/mm/charge_reserved_hugetlb.sh  |  8 ++++++++
>  tools/testing/selftests/mm/hugetlb_reparenting_test.sh | 10 ++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
> index a1cfd3a349db6..65065b1377b24 100755
> --- a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
> +++ b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
> @@ -39,6 +39,14 @@ if [[ $cgroup2 ]]; then
>      mount -t cgroup2 none $cgroup_path
>      do_umount=1
>    fi
> +  if ! grep -qw hugetlb $cgroup_path/cgroup.controllers; then
> +    echo "hugetlb controller not available in cgroup v2. Skipping..."
> +    if [[ $do_umount ]]; then
> +      umount $cgroup_path
> +      rmdir $cgroup_path
> +    fi
> +    exit $ksft_skip
> +  fi
>    echo "+hugetlb" >$cgroup_path/cgroup.subtree_control
>  else
>    cgroup_path=$(mount -t cgroup | grep ",hugetlb" | awk '{print $3}')
> diff --git a/tools/testing/selftests/mm/hugetlb_reparenting_test.sh b/tools/testing/selftests/mm/hugetlb_reparenting_test.sh
> index 95f517c3bd167..811912ae7d975 100755
> --- a/tools/testing/selftests/mm/hugetlb_reparenting_test.sh
> +++ b/tools/testing/selftests/mm/hugetlb_reparenting_test.sh
> @@ -29,6 +29,16 @@ if [[ $cgroup2 ]]; then
>      mount -t cgroup2 none $CGROUP_ROOT
>      do_umount=1
>    fi
> +  for ctrl in hugetlb memory; do
> +    if ! grep -qw $ctrl $CGROUP_ROOT/cgroup.controllers; then
> +      echo "$ctrl controller not available in cgroup v2. Skipping..."
> +      if [[ $do_umount ]]; then
> +        umount $CGROUP_ROOT
> +        rmdir $CGROUP_ROOT
> +      fi
> +      exit $ksft_skip
> +    fi
> +  done
>    echo "+hugetlb +memory" >$CGROUP_ROOT/cgroup.subtree_control
>  else
>    CGROUP_ROOT=$(mount -t cgroup | grep ",hugetlb" | awk '{print $3}')
> 
> ---
> base-commit: 437a7e839def0f505277022622fc59a8b071d6cf
> change-id: 20261016-bug-selftests-mm-hugetlb-cgroup2-skip-7fc0316486f2
> 
> Best regards,
> -- 
> Qiliang Yuan <odys.yuan@gmail.com>
